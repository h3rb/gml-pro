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

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const float glarebasesize = 0.896;
const float power = 0.50;

uniform float time;
uniform sampler2D tex0;
uniform vec2 textureSize;
uniform vec2 outputSize;
uniform vec3 tone; //green = vec3(0.17, 0.62, 0.25);

float luminance(vec3 c) {
 return (0.212671 * c.r) + (0.715160 * c.g) + (0.072169 * c.b);
}

float scanline(float ypos) {
 float c = mod(time * 3.0 + ypos * 5.0, 15.0);        
 return 1.0 - smoothstep(0.0, 1.0, c);
}

vec4 effect() {
        vec4 sum = vec4(0.0);
        vec4 bum = vec4(0.0);
        vec2 glaresize = vec2(glarebasesize) / textureSize;      
                
        sum += texture2D(tex0, v_vTexcoord + vec2( 2, -1)*glaresize) * power;
        bum += texture2D(tex0, v_vTexcoord + vec2(-1, -2)*glaresize) * power;            
        sum += texture2D(tex0, v_vTexcoord + vec2( 2,  0)*glaresize) * power;
        bum += texture2D(tex0, v_vTexcoord + vec2( 0, -2)*glaresize) * power;                                    
        sum += texture2D(tex0, v_vTexcoord + vec2( 2,  1)*glaresize) * power;
        bum += texture2D(tex0, v_vTexcoord + vec2( 1, -2)*glaresize) * power;            
                        
        sum += texture2D(tex0, v_vTexcoord + vec2( 1, -1)*glaresize) * power;
        bum += texture2D(tex0, v_vTexcoord + vec2(-1, -1)*glaresize) * power;            
        sum += texture2D(tex0, v_vTexcoord + vec2( 1,  0)*glaresize) * power;
        bum += texture2D(tex0, v_vTexcoord + vec2( 0, -1)*glaresize) * power;                                    
        sum += texture2D(tex0, v_vTexcoord + vec2( 1,  1)*glaresize) * power;
        bum += texture2D(tex0, v_vTexcoord + vec2( 1, -1)*glaresize) * power;            

        sum += texture2D(tex0, v_vTexcoord + vec2( 0, -1)*glaresize) * power;
        bum += texture2D(tex0, v_vTexcoord + vec2(-1,  0)*glaresize) * power;            
        sum += texture2D(tex0, v_vTexcoord + vec2( 0,  0)*glaresize) * power;
        bum += texture2D(tex0, v_vTexcoord + vec2( 0,  0)*glaresize) * power;                                    
        sum += texture2D(tex0, v_vTexcoord + vec2( 0,  1)*glaresize) * power;
        bum += texture2D(tex0, v_vTexcoord + vec2( 1,  0)*glaresize) * power;            
        
        sum += texture2D(tex0, v_vTexcoord + vec2(-1, -1)*glaresize) * power;
        bum += texture2D(tex0, v_vTexcoord + vec2(-1,  1)*glaresize) * power;            
        sum += texture2D(tex0, v_vTexcoord + vec2(-1,  0)*glaresize) * power;
        bum += texture2D(tex0, v_vTexcoord + vec2( 0,  1)*glaresize) * power;                                    
        sum += texture2D(tex0, v_vTexcoord + vec2(-1,  1)*glaresize) * power;
        bum += texture2D(tex0, v_vTexcoord + vec2( 1,  1)*glaresize) * power;            

        sum += texture2D(tex0, v_vTexcoord + vec2(-2, -1)*glaresize) * power;
        bum += texture2D(tex0, v_vTexcoord + vec2(-1,  2)*glaresize) * power;            
        sum += texture2D(tex0, v_vTexcoord + vec2(-2,  0)*glaresize) * power;
        bum += texture2D(tex0, v_vTexcoord + vec2( 0,  2)*glaresize) * power;                                    
        sum += texture2D(tex0, v_vTexcoord + vec2(-2,  1)*glaresize) * power;
        bum += texture2D(tex0, v_vTexcoord + vec2( 1,  2)*glaresize) * power;            
                 
        vec4 texcolor = texture2D(tex0, v_vTexcoord); 
        float y_one = 1.0 / outputSize.y;
        float alpha = (scanline(v_vTexcoord.y) + scanline(v_vTexcoord.y + y_one * 1.5) + scanline(v_vTexcoord.y - y_one * 1.5)) / 3.0;
        
        vec4 finalcolor;
        if (texcolor.r < 2.0) {
         finalcolor = sum*sum*sum*0.001+bum*bum*bum*0.0080 * (0.8 + 0.05 * alpha) + texcolor;
        } else {
         finalcolor = vec4(0.0, 0.0, 0.0, 1.0);
        }        
        float lum = pow(abs(luminance(finalcolor.rgb)), 1.4);        
        finalcolor.rgb = lum * tone + (alpha * 0.03);
        finalcolor.a = 1.0;        
        return finalcolor;
}

void main() {
 gl_FragColor = v_vColour * effect();
}
