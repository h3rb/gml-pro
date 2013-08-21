// Render hot/cold effect overlay
var i,j,r1,r2,ratio,xw,yh,holesize;

var o;
o=argument0;

var alpha;
alpha=o.alpha;

o.shipfx_instant+=1/room_width;

// Set target surface for generating the trans-additive layer
var scx,scy; // surface center
var surf;    // surface we're picking
surf=global.surface_1024;
scx=512;
scy=512;

var sox,soy;  // sub sprite offsets
sox=sprite_get_xoffset(o.spritesub);
soy=sprite_get_yoffset(o.spritesub);

// Clear it with rgba(0,0,0,0)
surface_set_target(surf);
draw_clear_alpha(c_black,0);
draw_set_blend_mode(bm_normal);

var sw,sh,sw2,sh2;  // sprite w/h
sw=sprite_get_width(o.spritesub);
sh=sprite_get_height(o.spritesub);
sw2=sw/2;
sh2=sh/2;

var px1,py1,dpx,dpy; // offset point x, offset point y, delta draw point x, delta draw point y
dpx=sw/o.damage_w;
dpy=sh/o.damage_h;

var melttween=tween(17,o.shipfx_instant);

// Draw effect overlay (Pass 1)
py1=scy-soy;
for ( j=0; j<o.damage_h; j++ ) {
 px1=scx-sox;
 for ( i=0; i<o.damage_w; i++ ) {
  // Draw heat/freezing
  if ( o.damage[i,j] != -666 ) {
   if ( o.melted[i,j] > 0 ) {
    ratio=o.melted[i,j]/100;
    draw_sprite_ext(o.melted_sprite[i,j],o.melted_num[i,j],
     px1,py1,ratio,ratio,(i+j)%360,c_white,ratio);
   }
   if ( o.heatcold[i,j] > 60 ) {
    ratio=o.heatcold[i,j]/273.0;
    var meltintensity;
    meltintensity=223+32*melttween;
    draw_sprite_ext(s_melt,0,px1,py1,ratio,ratio,(i+j)%360+o.shipfx_instant,
     make_color_rgb(meltintensity,meltintensity,meltintensity),
     ratio
    );
    draw_set_blend_mode(bm_add); // looks better without
    draw_sprite_ext(s_melt,0,px1,py1,ratio,ratio,(i+j)%360+o.shipfx_instant,
     make_color_rgb(meltintensity,meltintensity,meltintensity),
     ratio
    );
    draw_set_blend_mode(bm_normal);
   } else if ( heatcold[i,j] < -60 ) {
    ratio=heatcold[i,j]/(-273.0);
    draw_sprite_ext(s_freeze,0,px1,py1,ratio,ratio,(i+j)%360,c_white,ratio);
   }
  }
  px1+=dpx;
 }
 py1+=dpy;
}

// Draw "holes in hull" (Pass 2)
py1=scy-soy;
for ( j=0; j<o.damage_h; j++ ) {
 px1=scx-sox;
 for ( i=0; i<o.damage_w; i++ ) {
  if ( o.ejections[i,j] > 0 ) {
   if ( o.ejection_alpha[i,j] < 1.0 ) o.ejection_alpha[i,j]+=0.05;
   if ( o.ejections[i,j] > 20.0 ) holesize=1;
   else holesize=o.ejections[i,j]/20;
   if ( holesize < 0.1 ) holesize=0.1;
   draw_sprite_ext(s_holes,(i+j)%sprite_get_number(s_holes),
    px1,py1,holesize,holesize,(i+j)%360,
    c_white,o.ejection_alpha[i,j]
   );
  }
  px1+=dpx;
 }
 py1+=dpy;
}

px1=scx-sox;
py1=scy-soy;
var px2,py2;
px2=px1+sw;
py2=py1+sh;

// Crop with subtractive layer
//  +----------+
//  |__11___21_| <- white rectangle to fill edges
//  |___|__|___|  
//  |__12___22_|
draw_set_blend_mode(bm_subtract);
//draw_set_blend_mode(bm_normal);  // used for debugging
draw_sprite_ext(o.spritesub,0,scx,scy,1,1,0,c_white,1);//0);//alpha);

draw_set_alpha(1);
draw_set_color(c_white);
draw_rectangle(0,0,2048,py1,false);
draw_rectangle(0,0,px1,2048,false);
draw_rectangle(px2,py1,2048,2048,false);
draw_rectangle(0,py2,2048,2048,false);

surface_reset_target();

//xw=512*scale;
//yh=512*scale;
//draw_surface_rotate_origin(global.surface_512a,256,256,x-32,y,scale,scale,image_angle,c_white,0.65*alpha);
//draw_surface_rotate_origin3(global.surface_512a,256,256,x-32,y,scale,scale,image_angle,c_white,0.65*alpha);
// -32, why?
//draw_surface_ext(global.surface_512a,x-xw/2,y-yh/2,scale,scale,image_angle,c_white,0.65*alpha);
draw_set_blend_mode(bm_normal);
draw_set_color(c_white);
draw_set_alpha(0.7*o.alpha);//draw_set_alpha(0.65*o.alpha);
draw_surface_rotate_origin(surf,
 scx,scy,
 o.x,o.y,
 o.image_angle,o.scale,o.scale);
draw_set_alpha(1.0);

//draw_set_blend_mode(bm_normal);

