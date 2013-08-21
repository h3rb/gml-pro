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
uniform vec2 mouse;
uniform float time;
uniform sampler2D tex0;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

vec3 deform( in vec2 p )
{
    vec2 uv;
    vec2 q = vec2( sin(1.1*time+p.x),sin(1.2*time+p.y) );
    float a = atan(q.y,q.x);
    float r = sqrt(dot(q,q));
    uv.x = sin(0.0+1.0*mouse.x)+p.x*sqrt(r*r+1.0);
    uv.y = sin(0.6+1.1*mouse.y)+p.y*sqrt(r*r+1.0);
    return texture2D(tex0,uv*0.5).xyz;
}
void main(void) {
    vec2 p = -1.0 + 2.0 * (Position+v_vTexcoord*Viewport) / Resolution; // was +gl_FragCoord.xy
    vec2 s = p;
    vec3 total = vec3(0.0);
    vec2 d = (vec2(0.0,0.0)-p)/40.0;
    float w = 1.0;
    for( int i=0; i<40; i++ ) {
        vec3 res = deform(s);
        res = smoothstep(0.1,1.0,res*res);
        total += w*res;
        w *= 0.99;
        s += d;
    }
    total /= 40.0;
    float r = 1.5/(1.0+dot(p,p));
    gl_FragColor = vec4( vec3(total*r)*v_vColour.rgb,1.0);
}
