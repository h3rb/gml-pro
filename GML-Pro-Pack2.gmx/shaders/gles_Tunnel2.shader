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

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform sampler2D tex0; // scene buffer (input FBO of screen)
uniform float time; // time in seconds
uniform vec2 Resolution; // Screen resolution (target resolution)
uniform vec2 Position; // Screen resolution (target resolution)
uniform vec2 Viewport; // Screen resolution (target resolution)
varying vec2 v_vTexcoord;

void main(void) {
 vec2 p = -1.0 + 2.0 * (Position+v_vTexcoord*Viewport) / Resolution;  // was gl_FragCoord.xy
 vec2 uv;
 float a = atan(p.y,p.x);
 float r = sqrt(dot(p,p));
 uv.x = 0.15*time+ 0.1/r;
 uv.y = 0.1*time + a/(3.1416);
 vec4 Color=texture2D(tex0,uv);
 float d=distance(v_vTexcoord.xy,vec2(0.5,0.5));
 Color.rgb *= smoothstep(0.4,0.3,d);
 gl_FragColor = Color;
}
