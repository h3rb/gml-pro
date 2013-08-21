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

//######################_==_YOYO_SHADER_MARKER_==_######################@~// sequel to frosted.frag
//sceneTex (sampler2D): the final scene image.
//rnd_factor (float): effect param, default value: 0.05
//rnd_scale (float): effect param, default value: 5.1
//v1 (vec2): effect param, default value: vec2(92.,80.)
//v2 (vec2): effect param, default value: vec2(41.,62.)
uniform sampler2D sceneTex; // 0
uniform float rnd_factor;// = 0.05;
uniform float rnd_scale;// = 5.1;
uniform vec2 v1;// = vec2(92.,80.);
uniform vec2 v2;// = vec2(41.,62.);
varying vec2 v_vTexcoord;
float rand(vec2 co)
{
  return fract(sin(dot(co.xy ,v1)) + cos(dot(co.xy ,v2)) * rnd_scale);
}
void main() {
  vec2 uv = v_vTexcoord.xy;
  vec3 tc = vec3(1.0, 0.0, 0.0);
  vec2 rnd = vec2(rand(uv.xy),rand(uv.yx));
  tc = texture2D(sceneTex, uv+rnd*rnd_factor).rgb;
  gl_FragColor = vec4(tc, 1.0);
}
