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
uniform vec2 Scale; // 10, 5
uniform vec2 Factor; // 0.05, 0.1

void main() {
 vec2 texCoord = v_vTexcoord;
 texCoord.x = texCoord.x+cos(texCoord.y*Scale.x+time*Factor.x)*Factor.y;
 texCoord.y = texCoord.y+sin(texCoord.x*Scale.y+time*Factor.x)*Factor.y;
 gl_FragColor = texture2D(gm_BaseTexture, texCoord);
}
