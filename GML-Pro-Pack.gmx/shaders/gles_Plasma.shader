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
uniform vec2 Scale;
uniform vec4 factor;
uniform vec2 factor2;
varying vec2 v_vTexcoord;
void main(void)
{
   float x = Position.x+v_vTexcoord.x*Viewport.x; // was +gl_FragCoord.x
   float y = Position.y+v_vTexcoord.y*Viewport.y;
   float mov0 = x + y + cos(sin(time)*factor.w) * factor2.y + sin(x/factor.y) * factor.x;
   float mov1 = y / Resolution.y / Scale.y + time;
   float mov2 = x / Resolution.x / Scale.x;
   float C1 = abs(sin(mov1+time)/factor.w+mov2/factor.w-mov1-mov2+time);
   float C2 = abs(sin(C1+sin(mov0/factor.x+time)+sin(y/factor.z+time)+sin((x+y)/factor.y)*factor2.x));
   float C3 = abs(sin(C2+cos(mov1+mov2+C2)+cos(mov2)+sin(x/factor.x)));
   gl_FragColor = vec4( C1,C2,C3,1.0);
}
