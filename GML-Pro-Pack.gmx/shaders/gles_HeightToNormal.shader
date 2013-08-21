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

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform float coef;
uniform vec2 resolution;
uniform sampler2D tex0;
varying vec2 v_vTexcoord;
//float packNormal(float n) {return (n + 1) / 2; }
void main() {
 float dU=1.0/resolution.x;
 float dV=1.0/resolution.y;
 vec2 tc=v_vTexcoord;
 vec4 c=texture2D(tex0, tc);
 float s0 = c.r;
 float alph=c.a;
 c=texture2D(tex0, vec2(tc.x - dU, tc.y));
 float s1 = c.r;
 c=texture2D(tex0, vec2(tc.x, tc.y - dV));
 float s2 = c.r;
 c=texture2D(tex0, vec2(tc.x + dU, tc.y));
 float s3 = c.r;
 c=texture2D(tex0, vec2(tc.x, tc.y + dV));
 float s4 = c.r;
 vec2 n=normalize( vec2( (s1-s3), (s2-s4) ) ) * coef;
 gl_FragColor = 
  vec4( (n.x+1.0)/2.0, (n.y+1.0)/2.0, (1.0), c.a );
}
