attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

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
uniform vec4 threshold;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
void main() {
 vec4 sample=texture2D(tex0,v_vTexcoord);
 if ( sample.r < threshold.r && sample.g < threshold.g && sample.b < threshold.b ) 
  gl_FragColor=vec4(sample.rgb,(sample.r+sample.g+sample.b)/3.0);
 else gl_FragColor=sample;
}
