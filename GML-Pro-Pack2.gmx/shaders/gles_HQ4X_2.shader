//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
//varying vec2 v_vPixcoord;

//uniform vec2 ScreenSize;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
  //  v_vPixcoord = v_vTexcoord * ScreenSize;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
//varying vec2 v_vPixcoord;

uniform vec2 textureSize;
uniform sampler2D tex0;

const float mx = 0.325;    // start smoothing factor
const float k = -0.250;    // smoothing decrease factor
const float max_w = 0.25;
const float min_w =-0.10;  // min smoothing/sharpening weigth
const float lum_add = 0.2; // effects smoothing

vec4 effect()
{
        //float x = (inputSize.x/2048.0)*outputSize.x;
        //float y = (inputSize.y/1024.0)*outputSize.y;
        float dx = 0.5 * (1.0 / textureSize.x);
        float dy = 0.5 * (1.0 / textureSize.y);
        
        vec2 dg1 = vec2( dx,dy);
        vec2 dg2 = vec2(-dx,dy);
        vec2 sd11 = dg1*0.5;
        vec2 sd21 = dg2*0.5;
        
        vec3 c  = texture2D(tex0, v_vTexcoord).xyz;
        float alpha = texture2D(tex0, v_vTexcoord).a;
        vec3 i1 = texture2D(tex0, v_vTexcoord - sd11).xyz; 
        vec3 i2 = texture2D(tex0, v_vTexcoord - sd21).xyz; 
        vec3 i3 = texture2D(tex0, v_vTexcoord + sd11).xyz; 
        vec3 i4 = texture2D(tex0, v_vTexcoord + sd21).xyz; 
        vec3 o1 = texture2D(tex0, v_vTexcoord - dg1).xyz; 
        vec3 o3 = texture2D(tex0, v_vTexcoord + dg1).xyz; 
        vec3 o2 = texture2D(tex0, v_vTexcoord - dg2).xyz;
        vec3 o4 = texture2D(tex0, v_vTexcoord + dg2).xyz; 

        vec3 dt = vec3(1.0);

        float ko1=dot(abs(o1-c),dt);
        float ko2=dot(abs(o2-c),dt);
        float ko3=dot(abs(o3-c),dt);
        float ko4=dot(abs(o4-c),dt);

        float sd1 = dot(abs(i1-i3),dt);
        float sd2 = dot(abs(i2-i4),dt);

        float w1 = sd2; if (ko3<ko1) w1 = 0.0;
        float w2 = sd1; if (ko4<ko2) w2 = 0.0;
        float w3 = sd2; if (ko1<ko3) w3 = 0.0;
        float w4 = sd1; if (ko2<ko4) w4 = 0.0;

        c = (w1*o1+w2*o2+w3*o3+w4*o4+0.1*c)/(w1+w2+w3+w4+0.1);

        w3 = k/(0.4*dot(c,dt)+lum_add);
         
        w1 = clamp(w3*sd1+mx,min_w,max_w); 
        w2 = clamp(w3*sd2+mx,min_w,max_w);

        return vec4(w1*(i1+i3) + w2*(i2+i4) + (1.0-2.0*(w1+w2))*c, alpha);
}

void main() {
 gl_FragColor = v_vColour * effect();
}
