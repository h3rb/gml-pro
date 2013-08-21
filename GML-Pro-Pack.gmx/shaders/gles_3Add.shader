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

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform sampler2D tex0;
uniform sampler2D tex1;
uniform sampler2D tex2;
uniform sampler2D tex3;
varying vec2 v_vTexcoord;
void main() {
 vec4 mixer=texture2D(tex0,v_vTexcoord);
 vec4 sampleR=texture2D(tex1,v_vTexcoord);
 vec4 sampleG=texture2D(tex2,v_vTexcoord);
 vec4 sampleB=texture2D(tex3,v_vTexcoord);
 gl_FragColor=(sampleR*mixer.r+sampleG*mixer.g+sampleB*mixer.b);
}
