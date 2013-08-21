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
varying vec4 v_vColour;

uniform float time;
uniform float spd;
uniform float bendfactor;

void main() {
 float height = 1.0 - v_vTexcoord.y;
 float offset = pow(abs(height), 1.0);
 offset *= (sin(time * spd) * bendfactor);    
 vec4 normalColor = texture2D(gm_BaseTexture,
  fract( vec2(v_vTexcoord.x + offset, v_vTexcoord.y) )
 );
 gl_FragColor = normalColor; 
}


