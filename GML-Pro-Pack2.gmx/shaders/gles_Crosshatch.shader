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
uniform float hatch_y_offset; // 5.0
uniform vec4 lumT;   // 1.0  0.7  0.5 0.3
uniform vec2 Resolution;
varying vec2 v_vTexcoord;
void main()
{
  vec2 uv = v_vTexcoord.xy;
  vec2 FragCoord = v_vTexcoord*Resolution;
  vec3 tc = vec3(1.0, 0.0, 0.0);
  float lum = length(texture2D(sceneTex, uv).rgb);
  tc = vec3(1.0, 1.0, 1.0);
  if (lum < lumT.x) {
   if (mod(FragCoord.x + FragCoord.y, 10.0) == 0.0) // was gl_FragCoord
     tc = vec3(0.0, 0.0, 0.0);
  }
  if (lum < lumT.y) {
   if (mod(FragCoord.x - FragCoord.y, 10.0) == 0.0) // was gl_FragCoord
     tc = vec3(0.0, 0.0, 0.0);
  }
  if (lum < lumT.z) {
   if (mod(FragCoord.x + FragCoord.y - hatch_y_offset, 10.0) == 0.0) // was gl_FragCoord
     tc = vec3(0.0, 0.0, 0.0);
  }
  if (lum < lumT.w) {
   if (mod(FragCoord.x - FragCoord.y - hatch_y_offset, 10.0) == 0.0) // was gl_FragCoord
     tc = vec3(0.0, 0.0, 0.0);
  }
  gl_FragColor = vec4(tc, 1.0);
}
