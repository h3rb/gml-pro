attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 rubyTextureSize;
uniform vec2 rubyOutputSize;
uniform vec2 rubyInputSize;    

varying vec2 pixel_no;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * 
      vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    
    pixel_no = v_vTexcoord * rubyTextureSize;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec2 pixel_no;

uniform vec2 rubyTextureSize;
uniform sampler2D rubyTexture;

uniform float gamma; //const float gamma = 2.4;
uniform float shine; //const float shine = 0.50;
uniform float blend; //const float blend = 0.25;

float _dist(vec2 c, vec2 source)
{
   vec2 delta = c - source;
   return sqrt(dot(delta, delta));
}

float color_bloom(vec3 c)
{
   float bright = dot(c, vec3(0.30, 0.59, 0.11) );
   return mix(1.0 + shine, 1.0 - shine, bright);
}

vec3 L(vec2 offset, vec2 coord)
{
   vec3 c = texture2D(rubyTexture, coord).xyz;
   return c * exp(-gamma * _dist(fract(pixel_no), offset + vec2(0.5)) * color_bloom(c));
}

void main() {
    
    float dx = 1.0 / rubyTextureSize.x;
    float dy = 1.0 / rubyTextureSize.y;

    vec2 _c00 = v_vTexcoord + vec2(-dx, -dy);
    vec2 _c10 = v_vTexcoord + vec2(  0, -dy);
    vec2 _c20 = v_vTexcoord + vec2( dx, -dy);
    vec2 _c01 = v_vTexcoord + vec2(-dx,   0);
    vec2 _c11 = v_vTexcoord + vec2(  0,   0);
    vec2 _c21 = v_vTexcoord + vec2( dx,   0);
    vec2 _c02 = v_vTexcoord + vec2(-dx,  dy);
    vec2 _c12 = v_vTexcoord + vec2(  0,  dy);
    vec2 _c22 = v_vTexcoord + vec2( dx,  dy);

   vec3 m = L( vec2(0.0, 0.0), _c11);
   vec3 c = vec3(0.0) + m
    + L( vec2(-1.0, -1.0), _c00) + L( vec2( 0.0, -1.0), _c10)
    + L( vec2( 1.0, -1.0), _c20) + L( vec2(-1.0,  0.0), _c01)
    + L( vec2( 1.0,  0.0), _c21) + L( vec2(-1.0,  1.0), _c02)
    + L( vec2( 0.0,  1.0), _c12) + L( vec2( 1.0,  1.0), _c22);          
   vec3 o = mix(1.2 * m, c, blend);
   gl_FragColor = vec4(o, texture2D(rubyTexture,v_vTexcoord).a );
}
