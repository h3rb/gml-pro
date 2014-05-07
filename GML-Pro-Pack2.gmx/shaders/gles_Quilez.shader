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

//######################_==_YOYO_SHADER_MARKER_==_######################@~/*
#<!--
#    Fragment shader based on "Improved texture interpolation" by Iñigo Quílez
#
#    Original description:
#        http://www.iquilezles.org/www/articles/texture/texture.htm
#-->
*/
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D rubyTexture;
uniform vec2 rubyTextureSize;

vec4 getTexel(vec2 n) {
 vec2 tc = n * rubyTextureSize + vec2(0.5);
 vec2 i = floor(tc);
 vec2 f = tc - i;
 f = f * f * f * (f * (f * 6.0 - vec2(15.0)) + vec2(10.0));
 tc = i + f;
 tc = (tc - vec2(0.5)) / rubyTextureSize;
 return texture2D(rubyTexture, tc);
}

void main(void) {
 gl_FragColor = v_vColour * getTexel(v_vTexcoord);
}
