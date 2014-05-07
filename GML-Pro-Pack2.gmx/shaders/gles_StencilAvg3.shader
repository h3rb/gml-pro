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
varying vec4 v_vColour;            // final color to multiply by
uniform sampler2D tex0; // special stencil
uniform sampler2D tex1; // R value, where 0=transparent and 1=opaque
uniform sampler2D tex2; // G value
uniform sampler2D tex3; // B value
void main() {
 vec4 f0=texture2D(tex0,v_vTexcoord);
 vec4 fr=texture2D(tex1,v_vTexcoord);
 vec4 fg=texture2D(tex2,v_vTexcoord);
 vec4 fb=texture2D(tex3,v_vTexcoord);
 vec4 stenciled;
 stenciled= (fr*f0.r +fg*f0.g +fb*f0.b)/3.0;
 gl_FragColor=stenciled*v_vColour;
}
