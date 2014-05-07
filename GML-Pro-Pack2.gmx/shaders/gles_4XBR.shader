//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
//varying vec2 v_vPixcoord;

//uniform vec2 ScreenSize;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
//    v_vPixcoord = v_vTexcoord * ScreenSize;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
//varying vec2 v_vPixcoord; // isn't used?

uniform vec2 textureSize;
uniform sampler2D tex0;

const vec3 dtt = vec3(65536.0, 255.0, 1.0);

float reduce(vec3 c) { return dot(c, dtt); }

vec4 effect() {
        vec2 ps = 1.0 / textureSize;
        vec2 dx = vec2(ps.x, 0.0);
        vec2 dy = vec2(0.0, ps.y);

        vec2 pixcoord = v_vTexcoord/ps;
        vec2 fp        = fract(pixcoord);
        vec2 d11 = v_vTexcoord - fp * ps;

        // Reading the texture2Ds

        vec3 A = texture2D(tex0, d11-dx-dy).xyz;
        vec3 B = texture2D(tex0, d11   -dy).xyz;
        vec3 C = texture2D(tex0, d11+dx-dy).xyz;
        vec3 D = texture2D(tex0, d11-dx   ).xyz;
        vec3 E = texture2D(tex0, d11      ).xyz;
        vec3 F = texture2D(tex0, d11+dx   ).xyz;
        vec3 G = texture2D(tex0, d11-dx+dy).xyz;
        vec3 H = texture2D(tex0, d11+dy   ).xyz;
        vec3 I = texture2D(tex0, d11+dx+dy).xyz;

        vec3 E0 = E;
        vec3 E1 = E;
        vec3 E2 = E;
        vec3 E3 = E;
        vec3 E4 = E;
        vec3 E5 = E;
        vec3 E6 = E;
        vec3 E7 = E;
        vec3 E8 = E;
        vec3 E9 = E;
        vec3 E10 = E;
        vec3 E11 = E;
        vec3 E12 = E;
        vec3 E13 = E;
        vec3 E14 = E;
        vec3 E15 = E;

        float a = reduce(A);
        float b = reduce(B);
        float c = reduce(C);
        float d = reduce(D);
        float e = reduce(E);
        float f = reduce(F);
        float g = reduce(G);
        float h = reduce(H);
        float i = reduce(I);


        if ((h == f)&&(h != e))
        {
                if (
                ((e == g) && ((i == h) || (e == d)))
                ||
                ((e == c) && ((i == h) || (e == b)))
                )
                {
                        E11 = mix(E11, F,  0.5);        
                        E14 = E11;
                        E15 = F;
                }
        }

        if ((f == b)&&(f != e))
        {
                if (
                ((e == i) && ((f == c) || (e == h)))
                ||
                ((e == a) && ((f == c) || (e == d)))
                )
                {
                        E2 = mix(E2, B,  0.5);        
                        E7 = E2;
                        E3 = B;
                }
        }

        if ((b == d)&&(b != e))
        {
                if (
                ((e == c) && ((b == a) || (e == f)))
                ||
                ((e == g) && ((b == a) || (e == h)))
                )                        
                {
                        E1 = mix(E1, D,  0.5);        
                        E4 = E1;
                        E0 = D;
                }
        }

        if ((d == h)&&(d != e))
        {
                if (
                ((e == a) && ((d == g) || (e == b)))
                ||
                ((e == i) && ((d == g) || (e == f)))
                )
                {
                        E8 = mix(E8, H,  0.5);        
                        E13 = E8;
                        E12 = H;
                }
        }

        vec3 res;

        if (fp.x < 0.25)
        { 
                if (fp.y < 0.25) res = E0;
                else if ((fp.y > 0.25) && (fp.y < 0.50)) res = E4;
                else if ((fp.y > 0.50) && (fp.y < 0.75)) res = E8;
                else res = E12;
        }
        else if ((fp.x > 0.25) && (fp.x < 0.50))
        {
                if (fp.y < 0.25) res = E1;
                else if ((fp.y > 0.25) && (fp.y < 0.50)) res = E5;
                else if ((fp.y > 0.50) && (fp.y < 0.75)) res = E9;
                else res = E13;
        }
        else if ((fp.x > 0.50) && (fp.x < 0.75))
        {
                if (fp.y < 0.25) res = E2;
                else if ((fp.y > 0.25) && (fp.y < 0.50)) res = E6;
                else if ((fp.y > 0.50) && (fp.y < 0.75)) res = E10;
                else res = E14;
        }
        else
        {
                if (fp.y < 0.25) res = E3;
                else if ((fp.y > 0.25) && (fp.y < 0.50)) res = E7;
                else if ((fp.y > 0.50) && (fp.y < 0.75)) res = E11;
                else res = E15;
        }

        return vec4(res, 1.0); 
}

void main() {
 gl_FragColor = v_vColour * effect();
}
