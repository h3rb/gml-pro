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

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform float g_Time;

uniform vec4 m_FilterColor;
uniform float m_ColorDensity;
uniform float m_RandomValue;
uniform float m_NoiseDensity;
uniform float m_ScratchDensity;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// Computes the overlay between the source and destination colours.
vec3 overlay(vec3 src, vec3 dst) {
 float aa,bb,cc;
 if (dst.x <= 0.5) {aa = (2.0 * src.x * dst.x);} else {aa = (1.0 - 2.0 * (1.0 - dst.x) * (1.0 - src.x));} 
 if (dst.y <= 0.5) {bb = (2.0 * src.y * dst.y);} else {bb = (1.0 - 2.0 * (1.0 - dst.y) * (1.0 - src.y));}
 if (dst.z <= 0.5) {cc = (2.0 * src.z * dst.z);} else {cc = (1.0 - 2.0 * (1.0 - dst.z) * (1.0 - src.z));}
 return vec3(aa, bb, cc);
}

// 2D Noise by Ian McEwan, Ashima Arts.
vec3 mod289(vec3 xx) { return xx - floor(xx * (1.0 / 289.0)) * 289.0; }
vec2 mod289(vec2 xx) { return xx - floor(xx * (1.0 / 289.0)) * 289.0; }
vec3 permute(vec3 xx) { return mod289(((xx*34.0)+1.0)*xx); }

float snoise (vec2 v) {
 const vec4 C = vec4(0.211324865405187, // (3.0-sqrt(3.0))/6.0
                     0.366025403784439, // 0.5*(sqrt(3.0)-1.0)
                    -0.577350269189626, // -1.0 + 2.0 * C.x
                     0.024390243902439); // 1.0 / 41.0

 // First corner
 vec2 i = floor(v + dot(v, C.yy) );
 vec2 x0 = v - i + dot(i, C.xx);

 // Other corners
 vec2 i1;
 i1 = (x0.x > x0.y) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
 vec4 x12 = x0.xyxy + C.xxzz;
 x12.xy -= i1;

 // Permutations
 i = mod289(i); // Avoid truncation effects in permutation
 vec3 pp = permute( permute( i.y + vec3(0.0, i1.y, 1.0 )) + i.x + vec3(0.0, i1.x, 1.0 ));
 vec3 m = max(0.5 - vec3(dot(x0,x0), dot(x12.xy,x12.xy), dot(x12.zw,x12.zw)), 0.0);
 m = m*m ;
 m = m*m ;
 // Gradients: 41 points uniformly over a line, mapped onto a diamond.
 // The ring size 17*17 = 289 is close to a multiple of 41 (41*7 = 287)

 vec3 xx = 2.0 * fract(pp * C.www) - 1.0;
 vec3 h = abs(xx) - 0.5;
 vec3 ox = floor(xx + 0.5);
 vec3 a0 = xx - ox;

 // Normalise gradients implicitly by scaling m
 // Approximation of: m *= inversesqrt( a0*a0 + h*h );
 m *= 1.79284291400159 - 0.85373472095314 * ( a0*a0 + h*h );

 // Compute final noise value at P
 vec3 gg;
 gg.x = a0.x * x0.x + h.x * x0.y;
 gg.yz = a0.yz * x12.xz + h.yz * x12.yw;
 return 130.0 * dot(m, gg);
}

void main() {
 // Convert to grayscale
 vec3 colour = texture2D(gm_BaseTexture, v_vTexcoord).rgb;
 float gray = (colour.r + colour.g + colour.b) / 3.0;
 vec3 grayscale = vec3(gray);

 // Apply overlay
 vec3 finalColour = overlay(m_FilterColor.rgb, grayscale);

 // Lerp final colour
 float colorFactor = clamp(m_ColorDensity, 0.0, 1.0);
 finalColour = grayscale + colorFactor * (finalColour - grayscale);

 // Add noise
 float noiseFactor = clamp(m_NoiseDensity, 0.0, 1.0);
 float noise = snoise(v_vTexcoord * vec2(1024.0 + m_RandomValue * 512.0, 1024.0 + m_RandomValue * 512.0)) * 0.5;
 finalColour += noise * noiseFactor;

 // Apply scratches
 float scratchFactor = clamp(m_ScratchDensity, 0.0, 1.0);
 if ( m_RandomValue < scratchFactor ) {
  // Pick a random spot to show scratches
  float dist = 1.0 / scratchFactor;
  float d = distance(v_vTexcoord, vec2(m_RandomValue * dist, m_RandomValue * dist));
  if ( d < 0.4 ) {
   // Generate the scratch
   float xPeriod = 8.0;
   float yPeriod = 1.0;
   float pii = 3.141592;
   float phase = g_Time;
   float turbulence = snoise(v_vTexcoord * 2.5);
   float vScratch = 0.5 + (sin(((v_vTexcoord.x * xPeriod + v_vTexcoord.y * yPeriod + turbulence)) * pii + phase) * 0.5);
   vScratch = clamp((vScratch * 10000.0) + 0.35, 0.0, 1.0);
   finalColour.xyz *= vScratch;
  }
 }

 // Apply colour
 gl_FragColor.xyz = finalColour * texture2D(gm_BaseTexture, v_vTexcoord).rgb;
 gl_FragColor.w = 1.0;
}
