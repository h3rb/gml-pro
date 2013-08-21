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
uniform vec2 Position;
uniform vec2 Resolution;
uniform vec3 undulation;
uniform float time;

float f(vec3 o) {
 float a=(sin(o.x)+o.y*0.25)*0.35;
 o=vec3(cos(a)*o.x-sin(a)*o.y,sin(a)*o.x+cos(a)*o.y,o.z);
 return dot(cos(o)*cos(o),vec3(1))-1.2;
}

vec3 m( vec3 colorRGB_0, vec3 colorRGB_1, vec3 alpha ) {
 return colorRGB_0  + alpha * (colorRGB_1 - colorRGB_0);
}

vec3 s(vec3 o,vec3 d) {
 float t=0.0;
 float dt = 0.2;
 float nh = 0.0;
 float lh = 0.0;
 // Repeat 50 times...
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; }
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; } 
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; } 
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; } 
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; } 
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; } 
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; } 
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; } 
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; } 
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; } 
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; } 
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; } 
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; } 
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; } 
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; } 
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; } 
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; } 
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; } 
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; } 
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; } 
 nh = f(o+d*t); if (nh>0.0) { lh=nh; t+=dt; } 
 nh = f(o+d*t); if (nh>0.0) { return vec3(0.93,0.94,0.85); } 
 t = t - dt*nh/(nh-lh);
 vec3 e=vec3(0.1,0.0,0.0);
 vec3 p=o+d*t;
 vec3 n=-normalize(vec3(f(p+e),f(p+e.yxy),f(p+e.yyx))+vec3((sin(p*75.0)))*0.01); 
 if ( mod(length(p.xy)*20.,2.)<1.0 )
  return m(
   vec3(0.71,0.85,0.25) * ((max(-dot(n,vec3(.577)),0.) + 0.125*max(-dot(n,vec3(-0.707,-0.707,0)),0.0))), 
   vec3(0.93,0.94,0.85), vec3(pow(t/9.0,5.0))
  );
 else
  return m(
   vec3(0.79,0.93,0.4) * ((max(-dot(n,vec3(.577)),0.) + 0.125*max(-dot(n,vec3(-0.707,-0.707,0)),0.0))), 
   vec3(0.93,0.94,0.85), vec3(pow(t/9.0,5.0))
  );
}

void main() {
 vec2 p = -1.0 + 2.0 * (Position*v_vTexcoord) / Resolution; // was +gl_FragCoord.xy
 gl_FragColor= vec4(
  s(vec3(sin(time*undulation.x)*0.05,
  cos(time)*undulation.y,undulation.z*sin(time)),
  normalize(vec3(p.xy,1.0))),
  1.0
 );
}
