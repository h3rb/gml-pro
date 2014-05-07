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

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform sampler2D sceneTex; // FBO texture input (what to distort)
uniform vec2 lensRadius; // 0.45, 0.38
varying vec2 v_vTexcoord;
void main()
{
  vec4 Color = texture2D(sceneTex, v_vTexcoord);
  float dist = distance(v_vTexcoord, vec2(0.5,0.5));
  Color.rgb *= smoothstep(lensRadius.x, lensRadius.y, dist);
  gl_FragColor = Color;
}
