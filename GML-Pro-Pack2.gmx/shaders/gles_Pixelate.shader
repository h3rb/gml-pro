//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//sceneTex (sampler2D): the final scene image.
//vx_offset (float): offset of the vertical red line
//rt_w (float): render target width
//rt_h (float): render target height
//pixel_w (float): width of a low resolution pixel
//pixel_h (float): height of a low resolution pixel
uniform sampler2D sceneTex; // 0
uniform vec2 Resolution;
uniform vec2 Pixel;
varying vec2 v_vTexcoord;
void main() {
 vec2 uv = v_vTexcoord;
 vec3 tc = vec3(1.0, 0.0, 0.0);
 float dx = Pixel.x*(1.0/Resolution.x);
 float dy = Pixel.y*(1.0/Resolution.y);
 vec2 coord = vec2(dx*floor(uv.x/dx), dy*floor(uv.y/dy));
 tc = texture2D(sceneTex, coord).rgb;
 gl_FragColor = vec4(tc, 1.0);
}
