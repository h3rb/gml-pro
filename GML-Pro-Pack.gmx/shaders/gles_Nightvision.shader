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
uniform sampler2D noiseTex;
uniform sampler2D maskTex;
uniform float elapsedTime; // seconds
uniform float luminanceThreshold; // 0.2
uniform float colorAmplification; // 4.0
uniform vec3 visionColor; // = vec3(0.1, 0.95, 0.2); "green"
varying vec2 v_vTexcoord;
void main () {
 vec4 finalColor; 
 {
  vec2 uv;
  uv.x = 0.4*sin(elapsedTime*50.0);
  uv.y = 0.4*cos(elapsedTime*50.0);
  float m = texture2D(maskTex, v_vTexcoord).r;
  vec3 n = texture2D(noiseTex, (v_vTexcoord*3.5) + uv).rgb;
  vec3 c = texture2D(sceneBuffer, v_vTexcoord + (n.xy*0.005)).rgb;
  float lum = dot(vec3(0.30, 0.59, 0.11), c);
  if (lum < luminanceThreshold) c *= colorAmplification;
  finalColor.rgb = (c + (n*0.2)) * visionColor * m;
 }
 gl_FragColor.rgb = finalColor.rgb;
 gl_FragColor.a = 1.0;
}
