//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
uniform float time; 
uniform float colorAmp; 
uniform vec2 resolution;
uniform vec2 position;
uniform vec3 fader;
uniform float factor;
uniform vec4 p1,p2,p3,p4;

vec4 mod289(vec4 x) { return x - floor(x * (1.0 / p4.w)) * p4.w; }
vec4 permute(vec4 x){ return mod289(((x*p4.y)+1.0)*x); }
vec4 taylorInvSqrt(vec4 r) { return 1.79284291400159 - 0.85373472095314 * r; } 
vec2 fade(vec2 t)   { return t*t*t*(t*(t*fader.x-fader.y)+fader.z); }

// Classic Perlin noise
float cnoise(vec2 P){
 vec4 Pi = floor(P.xyxy) + vec4(0.0, 0.0, 1.0, 1.0);
 vec4 Pf = fract(P.xyxy) - vec4(0.0, 0.0, 1.0, 1.0);
 Pi = mod289(Pi); // To avoid truncation effects in permutation
 vec4 ix = Pi.xzxz;
 vec4 iy = Pi.yyww;
 vec4 fx = Pf.xzxz;
 vec4 fy = Pf.yyww;
 vec4 i = permute(permute(ix) + iy);
 vec4 gx = fract(i * (1.0 / factor)) * 2.0 - 1.0 ;
 vec4 gy = abs(gx) - 0.5 ;
 vec4 tx = floor(gx + 0.5);
 gx = gx - tx;
 vec2 g00 = vec2(gx.x,gy.x);
 vec2 g10 = vec2(gx.y,gy.y);
 vec2 g01 = vec2(gx.z,gy.z);
 vec2 g11 = vec2(gx.w,gy.w);
 vec4 norm = taylorInvSqrt(vec4(dot(g00, g00), dot(g01, g01), dot(g10, g10), dot(g11, g11)));
 g00 *= norm.x;  
 g01 *= norm.y;  
 g10 *= norm.z;  
 g11 *= norm.w;  
 float n00 = dot(g00, vec2(fx.x, fy.x));
 float n10 = dot(g10, vec2(fx.y, fy.y));
 float n01 = dot(g01, vec2(fx.z, fy.z));
 float n11 = dot(g11, vec2(fx.w, fy.w));
 vec2 fade_xy = fade(Pf.xy);
 vec2 n_x = mix(vec2(n00, n01), vec2(n10, n11), fade_xy.x);
 float n_xy = mix(n_x.x, n_x.y, fade_xy.y);
 return 2.3 * n_xy;
}

// Classic Perlin noise, periodic variant
float pnoise(vec2 P, vec2 rep){ 
    vec4 Pi = floor(P.xyxy) + vec4(0.0, 0.0, 1.0, 1.0);
    vec4 Pf = fract(P.xyxy) - vec4(0.0, 0.0, 1.0, 1.0);
    Pi = mod(Pi, rep.xyxy); // To create noise with explicit period
    Pi = mod289(Pi);        // To avoid truncation effects in permutation
    vec4 ix = Pi.xzxz;
    vec4 iy = Pi.yyww;
    vec4 fx = Pf.xzxz;
    vec4 fy = Pf.yyww;     
    vec4 i = permute(permute(ix) + iy);     
    vec4 gx = fract(i * (1.0 / factor)) * 2.0 - 1.0 ;
    vec4 gy = abs(gx) - 0.5 ;
    vec4 tx = floor(gx + 0.5);
    gx = gx - tx;     
    vec2 g00 = vec2(gx.x,gy.x);
    vec2 g10 = vec2(gx.y,gy.y);
    vec2 g01 = vec2(gx.z,gy.z);
    vec2 g11 = vec2(gx.w,gy.w);     
    vec4 norm = taylorInvSqrt(vec4(dot(g00, g00), dot(g01, g01), dot(g10, g10), dot(g11, g11)));
    g00 *= norm.x;  
    g01 *= norm.y;  
    g10 *= norm.z;  
    g11 *= norm.w;       
    float n00 = dot(g00, vec2(fx.x, fy.x));
    float n10 = dot(g10, vec2(fx.y, fy.y));
    float n01 = dot(g01, vec2(fx.z, fy.z));
    float n11 = dot(g11, vec2(fx.w, fy.w));     
    vec2 fade_xy = fade(Pf.xy);
    vec2 n_x = mix(vec2(n00, n01), vec2(n10, n11), fade_xy.x);
    float n_xy = mix(n_x.x, n_x.y, fade_xy.y);
    return p4.x * n_xy;
} 

float fbm(vec2 P, float octaves, float lacunarity, float gain){ 
 float sum = 0.0;
 float amp = 1.0;
 vec2 pp = P;     
 float i=0.0;
 if ( i < octaves ) { i+=1.0; amp *= gain; sum += amp * cnoise(pp); pp *= lacunarity; }
 else return sum;
 if ( i < octaves ) { i+=1.0; amp *= gain; sum += amp * cnoise(pp); pp *= lacunarity; }
 else return sum;
 if ( i < octaves ) { i+=1.0; amp *= gain; sum += amp * cnoise(pp); pp *= lacunarity; }
 else return sum;
 if ( i < octaves ) { i+=1.0; amp *= gain; sum += amp * cnoise(pp); pp *= lacunarity; }
 else return sum;
 if ( i < octaves ) { i+=1.0; amp *= gain; sum += amp * cnoise(pp); pp *= lacunarity; }
 else return sum;
 if ( i < octaves ) { i+=1.0; amp *= gain; sum += amp * cnoise(pp); pp *= lacunarity; }
 else return sum;
 if ( i < octaves ) { i+=1.0; amp *= gain; sum += amp * cnoise(pp); pp *= lacunarity; }
 else return sum;
 if ( i < octaves ) { i+=1.0; amp *= gain; sum += amp * cnoise(pp); pp *= lacunarity; }
 else return sum;
 if ( i < octaves ) { i+=1.0; amp *= gain; sum += amp * cnoise(pp); pp *= lacunarity; }
 else return sum;
 if ( i < octaves ) { i+=1.0; amp *= gain; sum += amp * cnoise(pp); pp *= lacunarity; }
 else return sum;
 if ( i < octaves ) { i+=1.0; amp *= gain; sum += amp * cnoise(pp); pp *= lacunarity; }
 else return sum;
 if ( i < octaves ) { i+=1.0; amp *= gain; sum += amp * cnoise(pp); pp *= lacunarity; }
 else return sum;
 if ( i < octaves ) { i+=1.0; amp *= gain; sum += amp * cnoise(pp); pp *= lacunarity; }
 else return sum;
 if ( i < octaves ) { i+=1.0; amp *= gain; sum += amp * cnoise(pp); pp *= lacunarity; }
 else return sum;
 if ( i < octaves ) { i+=1.0; amp *= gain; sum += amp * cnoise(pp); pp *= lacunarity; }
 return sum; 
} 

float pattern(in vec2 p) {
 float l = p3.x;
 float g = p3.y;
 float oc = 10.0;
 vec2 q = vec2( fbm( p + vec2(p2.x,p2.y),oc,l,g),fbm( p + vec2(p2.z,p2.w),oc,l,g));
 vec2 r = vec2( fbm( p + p4.z*q + vec2(p1.x,p1.y),oc,l,g ), fbm( p + p4.z*q + vec2(p1.z,p1.w) ,oc,l,g));
 return fbm( p + p4.z*r ,oc,l,g);    
} 

float pattern2( in vec2 p, out vec2 q, out vec2 r , in float time){
 float l = p3.z;
 float g = p3.w;
 float oc = 10.0;
 q.x = fbm( p + vec2(time,time),oc,l,g);
 q.y = fbm( p + vec2(p2.z*time,p2.w*time) ,oc,l,g);     
 r.x = fbm( p + p4.z*q + vec2(p1.x,p1.y),oc,l,g );
 r.y = fbm( p + p4.z*q + vec2(p1.z,p1.w) ,oc,l,g);     
 return fbm( p + p4.z*r ,oc,l,g);
} 

void main() {
 vec2 q = (v_vTexcoord*position) / resolution; // was +gl_FragCoord.xy
 vec2 p = -1.0 + 2.0 * q;
 vec2 qq;
 vec2 r;
 float color = pattern2(p,qq,r,time);     
 vec4 c = vec4(color,color,color,color);
 c *= colorAmp;     
 gl_FragColor = c;
}
