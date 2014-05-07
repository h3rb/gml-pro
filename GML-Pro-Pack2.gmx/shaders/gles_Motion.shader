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

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform vec2 Position;
uniform vec2 Resolution;
uniform vec2 Viewport;
uniform float time;
uniform sampler2D tex0;
uniform sampler2D tex1;
varying vec2 v_vTexcoord;

vec3 deform( in vec2 p, float scale )
{
    vec2 uv;
    float mtime = scale+time;
    float a = atan(p.y,p.x);
    float r = sqrt(dot(p,p));
    float s = r * (1.0+0.5*cos(mtime*1.7));
    uv.x = 0.1*mtime + 0.05*p.y + 0.05*cos(-mtime+a*3.0)/s;
    uv.y = 0.1*mtime + 0.05*p.x + 0.05*sin(-mtime+a*3.0)/s;
    float w = 0.8-0.2*cos(mtime+3.0*a);
    vec3 res = texture2D(tex0,uv).xyz*w;
    return res*res;
}

void main(void)
{
    vec2 p = -1.0 + 2.0 * (Position+v_vTexcoord*Viewport) / Resolution; // was +gl_FragCoord.xy
    vec3 total = vec3(0.0);
    float w = 0.0;
    vec3 res = deform(p,w); total += res; w += 0.02;
    res = deform(p,w); total += res; w += 0.02;
    res = deform(p,w); total += res; w += 0.02;
    res = deform(p,w); total += res; w += 0.02;
    res = deform(p,w); total += res; w += 0.02;
    res = deform(p,w); total += res; w += 0.02;
    res = deform(p,w); total += res; w += 0.02;
    res = deform(p,w); total += res; w += 0.02;
    res = deform(p,w); total += res; w += 0.02;
    res = deform(p,w); total += res; w += 0.02;
    res = deform(p,w); total += res; w += 0.02;
    res = deform(p,w); total += res; w += 0.02;
    res = deform(p,w); total += res; w += 0.02;
    res = deform(p,w); total += res; w += 0.02;
    res = deform(p,w); total += res; w += 0.02;
    res = deform(p,w); total += res; w += 0.02;
    res = deform(p,w); total += res; w += 0.02;
    res = deform(p,w); total += res; w += 0.02;
    res = deform(p,w); total += res; w += 0.02;
    res = deform(p,w); total += res; w += 0.02;
    res = deform(p,w); total += res; w += 0.02;    
    total /= 20.0;
    gl_FragColor = vec4( 3.0*total,1.0);
}
