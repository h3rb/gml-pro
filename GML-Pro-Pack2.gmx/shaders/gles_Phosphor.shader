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
      uniform vec2 rubyTextureSize;

      vec3 to_focus(float pixel)
      {
         pixel = mod(pixel + 3.0, 3.0);
         if (pixel >= 2.0) // Blue
            return vec3(pixel - 2.0, 0.0, 3.0 - pixel);
         else if (pixel >= 1.0) // Green
            return vec3(0.0, 2.0 - pixel, pixel - 1.0);
         else // Red
            return vec3(1.0 - pixel, pixel, 0.0);
      }

      void main()
      {
         float y = mod(v_vTexcoord.y * rubyTextureSize.y, 1.0);
         float intensity = exp(-0.2 * y);

         vec2 one_x = vec2(1.0 / (3.0 * rubyTextureSize.x), 0.0);

         vec3 c = texture2D(rubyTexture, v_vTexcoord.xy - 0.0 * one_x).xyz;
         vec3 color_prev = texture2D(rubyTexture, v_vTexcoord.xy - 1.0 * one_x).xyz;
         vec3 color_prev_prev = texture2D(rubyTexture, v_vTexcoord.xy - 2.0 * one_x).xyz;

         float pixel_x = 3.0 * v_vTexcoord.x * rubyTextureSize.x;

         vec3 focus = to_focus(pixel_x - 0.0);
         vec3 focus_prev = to_focus(pixel_x - 1.0);
         vec3 focus_prev_prev = to_focus(pixel_x - 2.0);

         vec3 result =
            0.8 * c * focus +
            0.6 * color_prev * focus_prev +
            0.3 * color_prev_prev * focus_prev_prev;

         result = 2.3 * pow(abs(result), vec3(1.4));

         gl_FragColor = v_vColour*vec4(intensity * result, 1.0);
      }
