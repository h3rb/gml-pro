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

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform sampler2D tex0;  // Scene buffer
uniform float time;  // time value
uniform vec2 resolution;  // render target
// Swirl effect parameters
uniform float radius;// = 200.0;
uniform float angle;// = 0.8;
uniform vec2 center;// = vec2(400.0, 300.0);
varying vec2 v_vTexcoord;

void main() {
 vec2 texSize = vec2(resolution.x, resolution.y);
 vec2 tc = v_vTexcoord * texSize;
 tc -= center;
 float dist = length(tc);
 if (dist < radius)
 {
  float percent = (radius - dist) / radius;
  float theta = percent * percent * angle * 8.0;
  float s = sin(theta);
  float c = cos(theta);
  tc = vec2(dot(tc, vec2(c, -s)), dot(tc, vec2(s, c)));
 }
 tc += center;
 vec3 color = texture2D(tex0, tc / texSize).rgb;
 gl_FragColor = vec4(color, 1.0);
}
