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

//######################_==_YOYO_SHADER_MARKER_==_######################@~
//Cubic Lens Distortion GLSL Shader
//http://vvvv.org/contribution/ft-cubic-lens-distortion
//r2 = image_aspect*image_aspect*u*u + v*v
//f = 1 + r2*(k + kcube*sqrt(r2))
//u' = f*u
//v' = f*v
varying vec2 v_vTexcoord;

uniform vec2 Viewport;
uniform sampler2D tex0;
uniform float k; // 0.2
uniform float kcube; // 0.3
uniform float dispersion; // 0.01
uniform vec2 center; // default was 0.5,0.5
uniform vec2 canvas; // default was 1.0,1.0
uniform vec3 disperseComponents; // default was 0.9, 0.6, 0.3
uniform float Scale; // 0.85

void main(void) {
 //index of refraction of each color channel, causing chromatic dispersion
 vec3 eta = vec3(1.0+dispersion*disperseComponents.r, 1.0+dispersion*disperseComponents.g, 1.0+dispersion*disperseComponents.b);
 //texture coordinates
 vec2 texcoord = v_vTexcoord;
 //canvas coordinates to get the center of rendered viewport
 vec2 cancoord = v_vTexcoord;
 float cx=center.x+(cancoord.x-canvas.x);
 float cy=center.y+(cancoord.y-canvas.y);
 float r2 =  cx*cx+cy*cy;
 float f = 1.0 + r2 * (k + kcube * sqrt(r2));
 // get the right pixel for the current position
 vec2 rCoords = (f*eta.r)*Scale*(texcoord.xy-0.5)+0.5;
 vec2 gCoords = (f*eta.g)*Scale*(texcoord.xy-0.5)+0.5;
 vec2 bCoords = (f*eta.b)*Scale*(texcoord.xy-0.5)+0.5;
 vec2 aCoords = (f*eta.b)*Scale*(texcoord.xy-0.5)+0.5;
 vec4 inputDistort = vec4(
  texture2D(tex0,rCoords).r,
  texture2D(tex0,gCoords).g,
  texture2D(tex0,bCoords).b,
  texture2D(tex0,bCoords).a
 ); 
 vec4 Color = inputDistort;
 gl_FragColor = Color;
}
