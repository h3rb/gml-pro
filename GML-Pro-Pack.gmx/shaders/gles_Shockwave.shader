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

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform sampler2D sceneTex; //  the final scene image.
uniform vec2 center; // center (in texture coord space: [0 ; 1]); Mouse position
uniform float time; // effect elapsed time (s)
uniform vec3 shockParams; // 10.0, 0.8, 0.1
varying vec2 v_vTexcoord;
void main(){
  vec2 uv = v_vTexcoord.xy;
  float distance = distance(uv, center);
  vec2 texCoord = uv;
  if ( (distance <= (time + shockParams.z)) && (distance >= (time - shockParams.z)) ) {
   float diff = (distance - time);
   float powDiff = 1.0 - pow(abs(diff*shockParams.x), shockParams.y);
   float diffTime = diff  * powDiff;
   vec2 diffUV = normalize(uv - center);
   texCoord = uv + (diffUV * diffTime);
  }
  gl_FragColor = texture2D(sceneTex, texCoord);
}
