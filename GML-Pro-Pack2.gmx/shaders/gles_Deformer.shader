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

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform vec3 rgbFactor;
uniform vec2 mouse;
uniform float time;
uniform vec2 textureOffset;
uniform vec2 Position;
uniform vec2 Resolution;
uniform vec2 Viewport;
uniform sampler2D tex0;
uniform sampler2D tex1;
varying vec2 v_vTexcoord;
void main(void)
{
    vec2 p = -1.0 + 2.0 * (Position+v_vTexcoord*Viewport) / Resolution; // was +gl_FragCoord.xy
    vec2 m = -1.0 + 2.0 * mouse;
    float a1 = atan(p.y-m.y,p.x-m.x);
    float r1 = sqrt(dot(p-m,p-m));
    float a2 = atan(p.y+m.y,p.x+m.x);
    float r2 = sqrt(dot(p+m,p+m));
    vec2 uv;
    uv.x = 0.2*time + (r1-r2)*0.25;
    uv.y = sin(2.0*(a1-a2));
    float w = r1*r2*0.8;
    vec3 col = texture2D(tex0,uv+textureOffset).xyz;
    gl_FragColor = vec4(rgbFactor*vec3(col/(0.1+w)),1.0);
}

