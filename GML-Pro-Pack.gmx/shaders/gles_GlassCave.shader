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
uniform vec2 Viewport;
uniform vec2 Resolution;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

//Object A (tunnel)
float oa(vec3 q) { return cos(q.x)+cos(q.y*1.5)+cos(q.z)+cos(q.y*20.0)*0.05; }

//Object B (ribbon)
float ob(vec3 q) {
 return length(
  max(
   abs( q - vec3(cos(q.z*1.5)*.3, -0.5+cos(q.z)*.2,.0) ) - vec3(0.125, 0.02, time+3.0),
   vec3(0.0)
  )
 );
}

//Scene
float o(vec3 q) { return oa(q); }
//note: activate ribbon instead here with:
//float o(vec3 q) { min(oa(q),ob(q)); }

//Get Normal
vec3 gn(vec3 q) {
 vec3 f=vec3(0.01,0.0,0.0);
 return normalize( vec3( o(q+f.xyy), o(q+f.yxy), o(q+f.yyx) ) );
}

void main() {
 vec2 p = -1.0 + 2.0 * (Position+v_vTexcoord*Viewport) / Resolution; // was +gl_Fragcoord.xy
 p.x *= Resolution.x/Resolution.y; // aspect
 vec4 c=vec4(1.0);
 vec3 org =vec3(
  sin(time)*0.5,
  cos(time*0.5)*0.25+0.25,
  0.0
 );
 vec3 dir=normalize(
  vec3(
   p.x*1.6,
   p.y,
   1.0
  )
 );
 vec3 q=org;
 float d=0.0;
 //First raymarching (64 steps)
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 /* 32 steps..
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
  */
 vec3 pp=q;
 float f=length(q-org)*0.02;
 //Second raymarching (reflection)
 dir=reflect(dir,gn(q));
 q+=dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 /* 32 steps..
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;  d=o(q); q+=d*dir;
 */
 c=max( dot(gn(q),vec3(.1,.1,.0)),0.0)
  +vec4(0.3,cos(time*0.5)*0.5+0.5,sin(time*0.5)*0.5+0.5,1.0)
  *min(length(q-org)*0.04,1.0);
 //Ribbon Color
// if(oa(pp)>ob(pp))c=mix(c,vec4(cos(time*.3)*.5+.5,cos(time*.2)*.5+.5,sin(time*.3)*.5+.5,1.),.3);
 //Final Color
 vec4 fcolor =
  ( (c+vec4(f)) + (1.0-min(pp.y+1.9,1.0)) * vec4(1.0,0.8,0.7,1.0) )
  * min(time*0.5,1.0);
 gl_FragColor=vec4(fcolor.xyz,1.0);
}
