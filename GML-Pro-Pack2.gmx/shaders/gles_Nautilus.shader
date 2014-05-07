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

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform float time;
uniform vec2 Position;
uniform vec2 Resolution;
uniform vec2 Viewport;
uniform vec2 mouse;
varying vec2 v_vTexcoord;

float e(vec3 c) {
 vec3 d=
  cos(
   vec3(
    cos(c.r+time/6.0)*c.r-cos(c.g*3.0+time/5.0)*c.g, 
    cos(time/4.0)*c.b/3.0*c.r-cos(time/7.0)*c.g,
    c.r+c.g+c.b+time
   )
  );
 return dot(d*d,vec3(1.0))-1.0;
}

vec2 c=vec2(0.0,0.0);
vec3 o=vec3(0.0,0.0,0.0);
vec3 v=vec3(0.5,0.5,0.5);
vec3 g=vec3(0.0,0.0,0.0);
float m=0.4;
void compute() {
 float h=e(o)-m;
 if ( h >= 0.0 ) {
  o+=h*10.0*g;
  v+=h*0.02;
 }
}

float a=0.0;
void compute2( float q ) {
 float l = 
  e(
   o + 0.5 
   * vec3( cos(1.1*q), cos(1.6*q), cos(1.4*q) )
  )-m;
 a+=clamp(4.0*l,0.0,1.0);
}

void main(void) {
 c=-1.0+2.0*(Position+v_vTexcoord*Viewport)/Resolution; // was +gl_FragCoord.xy
 g=vec3(c.x,c.y,1.0)/64.0;
 o=vec3(c.x,c.y,0.0);
//    float m = 0.4;
 m = 1.0-1.5*mouse.x/Resolution.x;
 compute(); compute(); compute(); compute(); compute();
 compute(); compute(); compute(); compute(); compute(); 
 compute(); compute(); compute(); compute(); compute();
 compute(); compute(); compute(); compute(); compute(); 
 compute(); compute(); compute(); compute(); compute();
 /*
 compute(); compute(); compute(); compute(); compute(); 
 compute(); compute(); compute(); compute(); compute();
 compute(); compute(); compute(); compute(); compute(); 
 compute(); compute(); compute(); compute(); compute();
 compute(); compute(); compute(); compute(); compute();
 */ 
 /*
 compute(); compute(); compute(); compute(); compute();
 compute(); compute(); compute(); compute(); compute(); 
 compute(); compute(); compute(); compute(); compute();
 compute(); compute(); compute(); compute(); compute(); 
 compute(); compute(); compute(); compute(); compute();
 compute(); compute(); compute(); compute(); compute(); 
 compute(); compute(); compute(); compute(); compute();
 compute(); compute(); compute(); compute(); compute(); 
 compute(); compute(); compute(); compute(); compute();
 compute(); compute(); compute(); compute(); compute(); 
 */
 // light (who needs a normal?)
 v+=e(o+0.1)*vec3(0.4,0.7,1.0);
 // ambient occlusion
 compute2( 0.0); compute2( 1.0); compute2( 2.0); compute2( 3.0); compute2( 4.0); compute2( 5.0); compute2( 6.0); compute2( 7.0); compute2( 8.0); compute2( 9.0);
 compute2(10.0); compute2(11.0); compute2(12.0); compute2(13.0); compute2(14.0); compute2(15.0); compute2(16.0); compute2(17.0); compute2(18.0); compute2(19.0);
 compute2(20.0); compute2(21.0); compute2(22.0); compute2(23.0); compute2(24.0); compute2(25.0); compute2(26.0); compute2(27.0); compute2(28.0); compute2(29.0);
 compute2(30.0); compute2(31.0); compute2(32.0); compute2(33.0); compute2(34.0); compute2(35.0); compute2(36.0); compute2(37.0); compute2(38.0); compute2(39.0);
 compute2(40.0); compute2(41.0); compute2(42.0); compute2(43.0); compute2(44.0); compute2(45.0); compute2(46.0); compute2(47.0); compute2(48.0); compute2(49.0);
 /*
 compute2(50.0); compute2(51.0); compute2(52.0); compute2(53.0); compute2(54.0); compute2(55.0); compute2(56.0); compute2(57.0); compute2(58.0); compute2(59.0);
 compute2(60.0); compute2(61.0); compute2(62.0); compute2(63.0); compute2(64.0); compute2(65.0); compute2(66.0); compute2(67.0); compute2(68.0); compute2(69.0);
 compute2(70.0); compute2(71.0); compute2(72.0); compute2(73.0); compute2(74.0); compute2(75.0); compute2(76.0); compute2(77.0); compute2(78.0); compute2(79.0);
 compute2(80.0); compute2(81.0); compute2(82.0); compute2(83.0); compute2(84.0); compute2(85.0); compute2(86.0); compute2(87.0); compute2(88.0); compute2(89.0);
 compute2(90.0); compute2(91.0); compute2(92.0); compute2(93.0); compute2(94.0); compute2(95.0); compute2(96.0); compute2(97.0); compute2(98.0); compute2(99.0);
 */
 v*=a/100.0;
 gl_FragColor=vec4(v,1.0);
}

