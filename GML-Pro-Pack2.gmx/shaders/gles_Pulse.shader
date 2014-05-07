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
uniform sampler2D tex0;
varying vec2 v_vTexcoord;
void main(void)
{
 vec2 h2 = Resolution/2.0;
 vec2 cPos = (Position+(Viewport*v_vTexcoord))/Resolution; // was +gl_FragCoord.xy);
 vec2 pos=cPos;
 cPos.x -= 0.5*h2.x*sin(time/2.0)+0.3*h2.x*cos(time)+h2.x;
 cPos.y -= 0.4*h2.y*sin(time/5.0)+0.3*h2.y*cos(time)+h2.y;
 float cLength = length(cPos);
 vec2 uv = pos/Resolution+(cPos/cLength)*sin(cLength/30.0-time*10.0)/25.0;
 vec3 col = texture2D(tex0,uv).xyz*50.0/cLength;
 gl_FragColor = vec4(col,1.0);
}
