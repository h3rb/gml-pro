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

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform sampler2D sceneTex; // 0
uniform vec3 c1;
uniform vec3 c2;
uniform vec3 c3;
varying vec2 v_vTexcoord;
vec3 m( vec3 A, vec3 B, float alpha ) { return A  + alpha * (B-A); }
void main() {
 vec2 uv = v_vTexcoord.xy;
 vec3 tc = vec3(1.0, 0.0, 0.0);
 vec4 pixcol = texture2D(sceneTex, uv);
 vec3 c1,c2,c3;
 c1 = vec3(0.,0.,1.0);
 c2 = vec3(1.,1.,0.0);
 c3 = vec3(1.,0.,0.0);
 float lum = (pixcol.r+pixcol.g+pixcol.b)/3.0;
 if ( lum < 0.5 ) {
  tc=m(c1,c2,lum/0.5);
 } else {
  tc=m(c2,c3,(lum-0.5)/0.5);
 }
 gl_FragColor = vec4(tc,pixcol.a);
}
