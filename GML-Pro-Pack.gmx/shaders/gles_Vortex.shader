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
uniform vec2 resolution;
uniform sampler2D tex0;
varying vec2 v_vTexcoord;
void main(void) {
    vec2 uv;
    vec2 p = -1.0 + 2.0 * (Position*v_vTexcoord) / resolution; // was +gl_FragColor.xy
    float a = atan(p.y,p.x);
    float r = sqrt(dot(p,p));
    float s = r * (1.0+0.8*cos(time*1.0));
    uv.x =          0.02*p.y+.03*cos(-time+a*3.0)/s;
    uv.y = 0.1*time+0.02*p.x+.03*sin(-time+a*3.0)/s;
    float w = 0.9 + pow(max(1.5-r,0.0),4.0);
    w*=0.6+0.4*cos(time+3.0*a);
    vec3 col =  texture2D(tex0,uv).xyz;
    gl_FragColor = vec4(col*w,1.0);
}
