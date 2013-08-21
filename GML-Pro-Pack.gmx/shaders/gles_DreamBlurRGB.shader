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
uniform float a,b,c,d,e,f,factor;
uniform vec2 offset;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
void main () {
  vec2 uv = v_vTexcoord.xy+offset.xy;
  vec4 g = texture2D(sceneTex, uv);
  g += texture2D(sceneTex, uv+a);
  g += texture2D(sceneTex, uv+b);
  g += texture2D(sceneTex, uv+c);
  g += texture2D(sceneTex, uv+d);
  g += texture2D(sceneTex, uv+e);
  g += texture2D(sceneTex, uv+f);
  g += texture2D(sceneTex, uv-a);
  g += texture2D(sceneTex, uv-b);
  g += texture2D(sceneTex, uv-c);
  g += texture2D(sceneTex, uv-d);
  g += texture2D(sceneTex, uv-e);
  g += texture2D(sceneTex, uv-f);
  gl_FragColor = g / vec4(factor);
}
