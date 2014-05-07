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

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

  uniform sampler2D rubyTexture;
  uniform vec2 rubyInputSize;
  uniform vec2 rubyTextureSize;

  uniform float distortion; // = 0.2;

  vec2 barrel(vec2 coord) {
    vec2 cc = coord - 0.5;
    float d = dot(cc, cc);
    return coord + cc * (d + distortion * d * d) * distortion;
  }

  void main(void) {
    gl_FragColor = texture2D(rubyTexture, 
    barrel(v_vTexcoord * rubyTextureSize / rubyInputSize)
     * rubyInputSize / rubyTextureSize);
  }
