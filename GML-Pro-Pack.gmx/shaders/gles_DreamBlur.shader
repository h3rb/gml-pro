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

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform sampler2D sceneTex; // 0

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main ()
{
  vec4 c = texture2D(sceneTex, v_vTexcoord);
  c += texture2D(sceneTex, v_vTexcoord+0.001);
  c += texture2D(sceneTex, v_vTexcoord+0.003);
  c += texture2D(sceneTex, v_vTexcoord+0.005);
  c += texture2D(sceneTex, v_vTexcoord+0.007);
  c += texture2D(sceneTex, v_vTexcoord+0.009);
  c += texture2D(sceneTex, v_vTexcoord+0.011);
  c += texture2D(sceneTex, v_vTexcoord-0.001);
  c += texture2D(sceneTex, v_vTexcoord-0.003);
  c += texture2D(sceneTex, v_vTexcoord-0.005);
  c += texture2D(sceneTex, v_vTexcoord-0.007);
  c += texture2D(sceneTex, v_vTexcoord-0.009);
  c += texture2D(sceneTex, v_vTexcoord-0.011);
  c.rgb = vec3((c.r+c.g+c.b)/3.0);
  c = c / 9.5;
  gl_FragColor = c*v_vColour;
}
