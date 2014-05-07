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
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 rubyTextureSize;
uniform sampler2D rubyTexture;

const float mx = 1.00; // start smoothing wt. 
const float k = -1.10; // wt. decrease factor 
const float max_w = 0.75; // max filter weigth 
const float min_w = 0.03; // min filter weigth 
const float lum_add = 0.33; // effects smoothing 

void main() {
 vec4 tc1;
 vec4 tc2;
 vec4 tc3;
 vec4 tc4;
 vec4 tc5;
 vec4 tc6;

 float dx = 0.001; float dy = 0.001;
 vec2 dg1 = vec2( dx,dy);
 vec2 dg2 = vec2(-dx,dy);
 vec2 sd1 = dg1*0.5;
 vec2 sd2 = dg2*0.5;
 vec2 ddx = vec2(dx,0.0);
 vec2 ddy = vec2(0.0,dy);
 tc1.xy = v_vTexcoord.xy - sd1;
 tc2.xy = v_vTexcoord.xy - sd2;
 tc3.xy = v_vTexcoord.xy + sd1;
 tc4.xy = v_vTexcoord.xy + sd2;
 tc5.xy = v_vTexcoord.xy - dg1;
 tc6.xy = v_vTexcoord.xy + dg1;
 tc5.zw = v_vTexcoord.xy - dg2;
 tc6.zw = v_vTexcoord.xy + dg2;
 tc1.zw = v_vTexcoord.xy - ddy;
 tc2.zw = v_vTexcoord.xy + ddx;
 tc3.zw = v_vTexcoord.xy + ddy;
 tc4.zw = v_vTexcoord.xy - ddx;
  
 vec3 c = texture2D(rubyTexture, v_vTexcoord.xy).xyz;
 vec3 i1 = texture2D(rubyTexture, tc1.xy).xyz;
 vec3 i2 = texture2D(rubyTexture, tc2.xy).xyz;
 vec3 i3 = texture2D(rubyTexture, tc3.xy).xyz;
 vec3 i4 = texture2D(rubyTexture, tc4.xy).xyz;
 vec3 o1 = texture2D(rubyTexture, tc5.xy).xyz;
 vec3 o3 = texture2D(rubyTexture, tc6.xy).xyz;
 vec3 o2 = texture2D(rubyTexture, tc5.zw).xyz;
 vec3 o4 = texture2D(rubyTexture, tc6.zw).xyz;
 vec3 s1 = texture2D(rubyTexture, tc1.zw).xyz;
 vec3 s2 = texture2D(rubyTexture, tc2.zw).xyz;
 vec3 s3 = texture2D(rubyTexture, tc3.zw).xyz;
 vec3 s4 = texture2D(rubyTexture, tc4.zw).xyz;
 vec3 dt = vec3(1.0,1.0,1.0);
 float ko1=dot(abs(o1-c),dt);
 float ko2=dot(abs(o2-c),dt);
 float ko3=dot(abs(o3-c),dt);
 float ko4=dot(abs(o4-c),dt);
 float k1=min(dot(abs(i1-i3),dt),max(ko1,ko3));
 float k2=min(dot(abs(i2-i4),dt),max(ko2,ko4));
 float w1 = k2; if(ko3<ko1) w1*=ko3/ko1;
 float w2 = k1; if(ko4<ko2) w2*=ko4/ko2;
 float w3 = k2; if(ko1<ko3) w3*=ko1/ko3;
 float w4 = k1; if(ko2<ko4) w4*=ko2/ko4;
 c=(w1*o1+w2*o2+w3*o3+w4*o4+0.001*c)/(w1+w2+w3+w4+0.001);
 w1 = k*dot(abs(i1-c)+abs(i3-c),dt)/(0.125*dot(i1+i3,dt)+lum_add);
 w2 = k*dot(abs(i2-c)+abs(i4-c),dt)/(0.125*dot(i2+i4,dt)+lum_add);
 w3 = k*dot(abs(s1-c)+abs(s3-c),dt)/(0.125*dot(s1+s3,dt)+lum_add);
 w4 = k*dot(abs(s2-c)+abs(s4-c),dt)/(0.125*dot(s2+s4,dt)+lum_add);
 w1 = clamp(w1+mx,min_w,max_w); w2 = clamp(w2+mx,min_w,max_w);
 w3 = clamp(w3+mx,min_w,max_w); w4 = clamp(w4+mx,min_w,max_w);
 vec3 bc=(w1*(i1+i3)+w2*(i2+i4)+w3*(s1+s3)+w4*(s2+s4)+c)/(2.0*(w1+w2+w3+w4)+1.0);
 gl_FragColor=vec4( bc, 1.0 );
}
