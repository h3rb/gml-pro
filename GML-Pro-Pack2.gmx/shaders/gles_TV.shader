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

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform sampler2D tex0;
uniform float time;
uniform vec2 Position;
uniform vec2 Resolution;
uniform vec2 Viewport;
uniform float size;
varying vec2 v_vTexcoord;

void main() {
 vec2 q = (Position+v_vTexcoord*Viewport)/ Resolution; // was +gl_FragCoord.xy
 vec2 uv = 0.5 + (q-0.5)*(0.9 + 0.1*sin(0.2*time));
 vec3 oricol = texture2D(tex0,vec2(q.x,q.y)).xyz;
 vec3 col;
 col.r = texture2D(tex0,vec2(uv.x+0.003,-uv.y)).x;
 col.g = texture2D(tex0,vec2(uv.x+0.000,-uv.y)).y;
 col.b = texture2D(tex0,vec2(uv.x-0.003,-uv.y)).z;
 col = clamp(col*0.5+0.5*col*col*1.2,0.0,1.0);
 col *= 0.9+0.1*sin(10.0*time+uv.y*size);
 gl_FragColor = vec4(col,1.0);
}
