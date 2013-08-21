     /*
        Script surface_get_alpha(surface_id,x,y) created by LaLaLa on 6/22/2010:
        
        Argument0 = surface_id = ID of the surface upon which the pixel to test exists.
        Argument1 = x          = X-coordinate of the pixel to test on the given surface.
        Argument2 = y          = Y-coordinate of the pixel to test on the given surface.
        
        Returns the alpha value of the given pixel contained within the given surface
        on a scale of 0 (completely transparent) to 1 (completely opaque) like what
        Game Maker uses in the draw_set_alpha() functions, etc.
        
        Note: This script resets the drawing target back to the normal screen buffer,
        so it will undo the changes if you are drawing on a surface when you call it!
    */
var old_alpha, r,g,b,lum;
old_alpha=draw_get_alpha();
surface_set_target(global.surface_1);
draw_clear_alpha(c_white,1);
draw_set_blend_mode_ext(bm_zero,bm_src_alpha);    
draw_surface_part(argument0,argument1,argument2,1,1,0,0);
surface_reset_target();
result=surface_getpixel(global.surface_1,0,0);
r=color_get_red(result);
g=color_get_green(result);
b=color_get_blue(result);
lum=((r+g+b)/3)/255.0;
draw_set_alpha(old_alpha);
draw_set_blend_mode(bm_normal);
//show_message(float(lum)+" result: red: "+float(r)+", green: "+float(g)+", blue: "+float(b));
return lum;

