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

//######################_==_YOYO_SHADER_MARKER_==_######################@~// (c)2012 H. Elwood Gilliland III - All rights reserved.
// Replaces code that layered/faded textures of different widths and heights around a point
uniform float time;
uniform float ts1,ts2,ts3;
uniform float t1,t2,t3;
uniform sampler2D tweens;
uniform sampler2D tex0;
uniform sampler2D tex1;
uniform sampler2D tex2;
uniform float a1,b1;
uniform float a2,b2;
uniform float a3,b3;
uniform float w1;
uniform float w2;
uniform float w3;
uniform vec3 c1,c2,c3;
varying vec2 v_vTexcoord;
void main() {
 float
  q1=1.1+((1.0-w1)*25.0),
  q2=1.1+((1.0-w2)*25.0),
  q3=1.1+((1.0-w3)*25.0);
 vec3 f0=texture2D(tweens,vec2((b1+ts1*time*(b1-a1)),t1)).rgb;
 vec3 f1=texture2D(tweens,vec2((b2+ts2*time*(b2-a2)),t2)).rgb;
 vec3 f2=texture2D(tweens,vec2((b3+ts3*time*(b3-a3)),t3)).rgb;
 vec2 trans=vec2(v_vTexcoord.x-0.5,v_vTexcoord.y-0.5);
 vec2 ww1=vec2(q1*trans.x,q1*trans.y);
 vec2 ww2=vec2(q2*trans.x,q2*trans.y);
 vec2 ww3=vec2(q3*trans.x,q3*trans.y);
 vec3 cc1=vec3(f0)*c1*texture2D(tex0,ww1+vec2(0.5,0.5)).rgb;
 vec3 cc2=vec3(f1)*c2*texture2D(tex1,ww2+vec2(0.5,0.5)).rgb;
 vec3 cc3=vec3(f2)*c3*texture2D(tex2,ww3+vec2(0.5,0.5)).rgb;
 vec3 added=(cc1+cc2+cc3);
 gl_FragColor=vec4(added,1.0);
}
