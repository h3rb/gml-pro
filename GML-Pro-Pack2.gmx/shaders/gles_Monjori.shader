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
uniform vec3 rgbFactor1;
uniform vec3 rgbFactor2;
uniform vec3 rgbFactor3;
varying vec2 v_vTexcoord;
void main() {
 vec2 p = -1.0 + 2.0 * (Position+(v_vTexcoord*Viewport)) / Resolution; // was +gl_FragCoord.xy
 float a = time*40.0;
 float d,e,f,g=1.0/40.0,h,i,r,q;
 e=400.0*(p.x*0.5+0.5);
 f=400.0*(p.y*0.5+0.5);
 i=200.0+sin(e*g+a/150.0)*20.0;
 d=200.0+cos(f*g/2.0)*18.0+cos(e*g)*7.0;
 r=sqrt(pow(i-e,2.0)+pow(d-f,2.0));
 q=f/r;
 e=(r*cos(q))-a/2.0;f=(r*sin(q))-a/2.0;
 d=sin(e*g)*176.0+sin(e*g)*164.0+r;
 h=((f+d)+a/2.0)*g;
 i=cos(h+r*p.x/1.3)*(e+e+a)+cos(q*g*6.0)*(r+h/3.0);
 h=sin(f*g)*144.0-sin(e*g)*212.0*p.x;
 h=(h+(f-e)*q+sin(r-(a+h)/7.0)*10.0+i/4.0)*g;
 i+= cos(h*2.3*sin(a/350.0-q))
   *184.0*sin(q-(r*4.3+a/12.0)*g)
   +tan(r*g+h)*184.0*cos(r*g+h);
 i=mod(i/5.6,256.0)/64.0;
 if(i<0.0) i+=4.0;
 if(i>=2.0) i=4.0-i;
 d=r/350.0;
 d+=sin(d*d*8.0)*0.52;
 f=(sin(a*g)+1.0)/2.0;
 gl_FragColor=vec4(
   vec3(f*i/rgbFactor1.x, i/rgbFactor1.y+d/rgbFactor3.y, i*rgbFactor1.z)
   *d*p.x
  +vec3(i/rgbFactor2.x+d/rgbFactor3.x,i/rgbFactor2.y+d/rgbFactor3.z,i*rgbFactor2.z)
   *d*(1.0-p.x),
  1.0
 );
//    gl_FragColor=vec4(vec3(f*i/1.6,i/2.0+d/13.0,i)*d*p.x+vec3(i/1.3+d/8.0,i/2.0+d/18.0,i)*d*(1.0-p.x),1.0);
}
