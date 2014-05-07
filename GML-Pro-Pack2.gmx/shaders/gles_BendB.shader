attribute vec3 in_Position;                  // (x,y,z)
attribute vec2 in_TextureCoord;              // (u,v)
varying vec2 v_vTexcoord;
void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    v_vTexcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform sampler2D tex0;
uniform sampler2D tex1;
varying vec2 v_vTexcoord;
void main(void) {
 vec4 b=texture2D(tex1,v_vTexcoord.st);
 float wx=v_vTexcoord.x+b.b*0.05;
 float wy=v_vTexcoord.y+b.b*0.05;
 gl_FragColor= texture2D(tex0, vec2(wx,wy));
}
