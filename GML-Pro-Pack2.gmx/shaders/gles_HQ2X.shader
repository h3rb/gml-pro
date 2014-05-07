//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 rubyTextureSize;
varying vec4 tc1;
varying vec4 tc2;
varying vec4 tc3;
varying vec4 tc4;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    
    float dx = 0.5 * (1.0 / rubyTextureSize.x);
    float dy = 0.5 * (1.0 / rubyTextureSize.y);
    vec2 dg1 = vec2( dx, dy);
    vec2 dg2 = vec2(-dx, dy);
    vec2 ddx = vec2(dx, 0.0);
    vec2 ddy = vec2(0.0, dy);

    tc1 = vec4( v_vTexcoord.xy - dg1, v_vTexcoord.xy - ddy );
    tc2 = vec4( v_vTexcoord.xy - dg2, v_vTexcoord.xy + ddx );
    tc3 = vec4( v_vTexcoord.xy + dg1, v_vTexcoord.xy + ddy );
    tc4 = vec4( v_vTexcoord.xy + dg2, v_vTexcoord.xy - ddx );
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec4 tc1;
varying vec4 tc2;
varying vec4 tc3;
varying vec4 tc4;

uniform sampler2D rubyTexture;
const float mx = 0.325; //uniform float mx;      //const float mx = 0.325;      // start smoothing wt.
const float k = -0.250; //uniform float k;       //const float k = -0.250;      // wt. decrease factor
const float max_w = 0.25; //uniform float max_w;   //const float max_w = 0.25;    // max filter weigth
const float min_w =-0.05; //uniform float min_w;   //const float min_w =-0.05;    // min filter weigth
const float lum_add = 0.25; //uniform float lum_add; //const float lum_add = 0.25;  // effects smoothing

  void main() {
    vec3 _c00 = texture2D(rubyTexture, tc1.xy).xyz; 
    vec3 _c10 = texture2D(rubyTexture, tc1.zw).xyz; 
    vec3 _c20 = texture2D(rubyTexture, tc2.xy).xyz; 
    vec3 _c01 = texture2D(rubyTexture, tc4.zw).xyz; 
    vec3 _c11 = texture2D(rubyTexture, v_vTexcoord).xyz; 
    vec3 _c21 = texture2D(rubyTexture, tc2.zw).xyz; 
    vec3 _c02 = texture2D(rubyTexture, tc4.xy).xyz; 
    vec3 _c12 = texture2D(rubyTexture, tc3.zw).xyz; 
    vec3 _c22 = texture2D(rubyTexture, tc3.xy).xyz; 
    vec3 dt = vec3(1.0, 1.0, 1.0);

    float md1 = dot(abs(_c00 - _c22), dt);
    float md2 = dot(abs(_c02 - _c20), dt);

    float w1 = dot(abs(_c22 - _c11), dt) * md2;
    float w2 = dot(abs(_c02 - _c11), dt) * md1;
    float w3 = dot(abs(_c00 - _c11), dt) * md2;
    float w4 = dot(abs(_c20 - _c11), dt) * md1;

    float t1 = w1 + w3;
    float t2 = w2 + w4;
    float ww = max(t1, t2) + 0.0001;

    _c11 = (w1 * _c00 + w2 * _c20 + w3 * _c22 + w4 * _c02 + ww * _c11) 
         / (t1 + t2 + ww);

    float lc1 = k / (0.12 * dot(_c10 + _c12 + _c11, dt) + lum_add);
    float lc2 = k / (0.12 * dot(_c01 + _c21 + _c11, dt) + lum_add);

    w1 = clamp(lc1 * dot(abs(_c11 - _c10), dt) + mx, min_w, max_w);
    w2 = clamp(lc2 * dot(abs(_c11 - _c21), dt) + mx, min_w, max_w);
    w3 = clamp(lc1 * dot(abs(_c11 - _c12), dt) + mx, min_w, max_w);
    w4 = clamp(lc2 * dot(abs(_c11 - _c01), dt) + mx, min_w, max_w);

    vec3 final = w1 * _c10 + w2 * _c21 + w3 * _c12 + w4 * _c01
               + (1.0 - w1 - w2 - w3 - w4) * _c11;
    gl_FragColor = vec4( final, 1 );
  }
