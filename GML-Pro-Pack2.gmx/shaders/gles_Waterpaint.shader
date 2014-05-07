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

//######################_==_YOYO_SHADER_MARKER_==_######################@~/*
     Themaister's Waterpaint shader
     Placed in the public domain. 
     (From this thread: http://board.byuu.org/viewtopic.php?p=30483#p30483 
     PD declaration here: http://board.byuu.org/viewtopic.php?p=30542#p30542 )
*/
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
 
uniform sampler2D tex0;
uniform vec2 textureSize;

 
vec4 compress(vec4 in_color, float threshold, float ratio)
{
        vec4 d = in_color - vec4(threshold);
        d = clamp(d, 0.0, 100.0);
        return in_color - (d * (1.0 - 1.0/ratio));
}
 
vec4 effect() {
        float tx = 0.5 * (1.0 / textureSize.x);
        float ty = 0.5 * (1.0 / textureSize.y);
        
        vec2 dg1 = vec2( tx, ty);
        vec2 dg2 = vec2(-tx, ty);
        vec2 dx = vec2(tx, 0.0);
        vec2 dy = vec2(0.0, ty);
                 
        vec3 _c00 = texture2D(tex0, v_vTexcoord - dg1).xyz;
        vec3 _c01 = texture2D(tex0, v_vTexcoord - dx).xyz;
        vec3 _c02 = texture2D(tex0, v_vTexcoord + dg2).xyz;
        vec3 _c10 = texture2D(tex0, v_vTexcoord - dy).xyz;
        vec3 _c11 = texture2D(tex0, v_vTexcoord).xyz;
        vec3 _c12 = texture2D(tex0, v_vTexcoord + dy).xyz;
        vec3 _c20 = texture2D(tex0, v_vTexcoord - dg2).xyz;
        vec3 _c21 = texture2D(tex0, v_vTexcoord + dx).xyz;
        vec3 _c22 = texture2D(tex0, v_vTexcoord + dg1).xyz;
        
        vec3 first  = mix(_c00, _c20, fract(v_vTexcoord.x * textureSize.x + 0.5));
        vec3 second = mix(_c02, _c22, fract(v_vTexcoord.x * textureSize.x + 0.5));
        
        vec3 mid_horiz = mix(_c01, _c21, fract(v_vTexcoord.x * textureSize.x + 0.5));
        vec3 mid_vert  = mix(_c10, _c12, fract(v_vTexcoord.y * textureSize.y + 0.5));
        
        vec3 res = mix(first, second, fract(v_vTexcoord.y * textureSize.y + 0.5));
        vec4 final = vec4(0.26 * (res + mid_horiz + mid_vert) + 3.5 * abs(res - mix(mid_horiz, mid_vert, 0.5)), 1.0);
        
        final = compress(final, 0.8, 5.0);
        final.a = 1.0;
        
        return final;
}

void main() {
 gl_FragColor = v_vColour * effect();
}
