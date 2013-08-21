var ship,i,j,gx,gy,gw,gh,ecks,why,d1,d2,d3,d4,avg;
ship=argument0;
ecks=argument1;
why=argument2;
angle_deg=argument3;
scale=argument4;

gw=(512)/ship.damage_w;
gh=(512)/ship.damage_h;

// Draw the grid
surface_set_target(global.surface_512b); // 512b
draw_clear_alpha(c_black, 0);

// Underdraw the sprite onto surface 512b using the appropriate blend mode
//draw_set_color(c_black);
//draw_set_blend_mode_ext(bm_src_color,bm_inv_src_alpha);
//draw_sprite(ship.sprite_index,0,256,256);

draw_set_blend_mode(bm_normal);
for ( i=0; i<ship.damage_w-1; i++ ) {
 for ( j=0; j<ship.damage_h-1; j++ ) {
  gx=i*gw;
  gy=j*gh;
  if ( ship.damage[i,j]==-666 ) {
  } else {
   d1=ship.damage[i,j]/100.0;
   d2=ship.damage[i+1,j]/100.0;
   d3=ship.damage[i+1,j+1]/100.0;
   d4=ship.damage[i,j+1]/100.0;
   draw_rectangle_color(gx,gy,gx+gw,gy+gh,
    damage_color(d1),
    damage_color(d2),
    damage_color(d3),
    damage_color(d4),
   false);
   avg=(d1+d2+d3+d4)/4;
   draw_set_color(merge_color(damage_color_fader(avg),damage_color(avg),0.5));
   draw_rectangle(gx,gy,gx+gw,gy+gh,true);
  }
 }
}

surface_reset_target(); // 512b

//draw_set_blend_mode(bm_add);
draw_set_blend_mode(bm_normal);
draw_surface_ext(global.surface_512b,ecks,why,scale,scale,angle_deg,c_white,1.0);

