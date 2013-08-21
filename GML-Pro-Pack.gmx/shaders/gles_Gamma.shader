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

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform sampler2D sceneBuffer;
uniform float gamma;
varying vec2 v_vTexcoord;
void main(void)
{
  vec2 uv = v_vTexcoord.xy;
  vec4 c = texture2D(sceneBuffer, uv);
  if (uv.x<0.50) {
   gl_FragColor.rgb = pow(abs(c.rgb), vec3(1.0 / gamma));
   gl_FragColor.a = c.a;
  } else gl_FragColor = c;
}
