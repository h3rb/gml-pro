//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.

varying vec2 v_vTexcoord;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~// (c)2012 H. Elwood Gilliland III - All rights reserved.
// Replaces code that layered/faded textures of different widths and heights around a point
uniform float time; // overall animation time
uniform sampler2D tweens;
uniform sampler2D tex0;
uniform sampler2D tex1;
uniform sampler2D tex2;
uniform vec3 T; // instant a,b,c=x,y,z
uniform vec3 TS; // timescale a,b,c=x,y,z  // try 1,1,1 to start
uniform vec3 A; // x=time, y=time2, z=width
uniform vec3 B;
uniform vec3 C;
uniform vec3 _c1,_c2,_c3;

varying vec2 v_vTexcoord;

void main() {
 float
  q1=1.1+((1.0-A.z)*25.0),
  q2=1.1+((1.0-B.z)*25.0),
  q3=1.1+((1.0-C.z)*25.0);
 vec3
  f0=texture2D(tweens,vec2((A.y+TS.x*time*(A.y-A.x)),T.x)).rgb,
  f1=texture2D(tweens,vec2((B.y+TS.y*time*(B.y-B.x)),T.y)).rgb,
  f2=texture2D(tweens,vec2((C.y+TS.z*time*(C.y-C.x)),T.z)).rgb;
 vec2 trans=vec2(v_vTexcoord.x-0.5,v_vTexcoord.y-0.5);
 vec2
  ww1=vec2(q1*trans.x,q1*trans.y),
  ww2=vec2(q2*trans.x,q2*trans.y),
  ww3=vec2(q3*trans.x,q3*trans.y);
 vec3
  cc1=vec3(f0)*_c1*texture2D(tex0,ww1+vec2(0.5,0.5)).rgb,
  cc2=vec3(f1)*_c2*texture2D(tex1,ww2+vec2(0.5,0.5)).rgb,
  cc3=vec3(f2)*_c3*texture2D(tex2,ww3+vec2(0.5,0.5)).rgb;
 vec3 added=(cc1+cc2+cc3);
 gl_FragColor=vec4(added,1.0);
}
