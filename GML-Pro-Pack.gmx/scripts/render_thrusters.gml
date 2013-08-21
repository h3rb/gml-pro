var o;
o=argument0;

if ( o.thrusting ) o.thrust_time+=1;
else if ( o.thrust_time > 0 ) o.thrust_time-=1;

var i;
// Render Thrusters
if ( o.thrust_time > 0.0 ) {
 draw_set_blend_mode(bm_add);
 if ( o.thrust_time >= sprite_get_number(s_jetrampup) and o.thrusting ) {
  o.thrustanim+=1;
  if ( o.thrustanim >= sprite_get_number(s_jetloop) ) o.thrustanim=0;
  for ( i=0; i<o.thrust_points; i++ ) {
   rotate_point(-degtorad(o.image_angle),o.thrust_x[i],o.thrust_y[i]);  
   global.script_rotate_point_x+=x;
   global.script_rotate_point_y+=y;
   draw_sprite_ext(s_jetloop,o.thrustanim,
    global.script_rotate_point_x,global.script_rotate_point_y,
    o.thrust_scale1x[i],o.thrust_scale1y[i],
    o.direction+o.thrustangle[i],
    o.thrustcolor,o.thrust_scale1a[i]
   );
   if ( o.thrust_layers[i] > 1 )
   draw_sprite_ext(s_jetloop,o.thrustanim,
    global.script_rotate_point_x,global.script_rotate_point_y,
    o.thrust_scale2x[i],o.thrust_scale2y[i],
    o.direction+o.thrustangle[i],
    o.thrustcolor,o.thrust_scale2a[i]
   );
   if ( o.thrust_layers[i] > 2 )
   draw_sprite_ext(s_jetloop,o.thrustanim,
    global.script_rotate_point_x,global.script_rotate_point_y,
    o.thrust_scale3x[i],o.thrust_scale3y[i],
    o.direction+o.thrustangle[i],
    o.thrustcolor,o.thrust_scale3a[i]
   );
  }
 } else {
  for ( i=0; i<o.thrust_points; i++ ) {
   rotate_point(-degtorad(image_angle),o.thrust_x[i],o.thrust_y[i]);//+o.thrustanimoffset[i]);
   global.script_rotate_point_x+=x;
   global.script_rotate_point_y+=y;
   draw_sprite_ext(s_jetrampup,o.thrust_time,
    global.script_rotate_point_x,global.script_rotate_point_y,
    o.thrust_scale1x[i],o.thrust_scale1y[i],
    o.direction+o.thrustangle[i],
    o.thrustcolor,o.thrust_scale1a[i]
   );
   if ( o.thrust_layers[i] > 1 )
   draw_sprite_ext(s_jetrampup,o.thrust_time,
    global.script_rotate_point_x,global.script_rotate_point_y,
    o.thrust_scale2x[i],o.thrust_scale2y[i],
    o.direction+o.thrustangle[i],
    o.thrustcolor,o.thrust_scale2a[i]
   );
   if ( o.thrust_layers[i] > 2 )
   draw_sprite_ext(s_jetrampup,o.thrust_time,
    global.script_rotate_point_x,global.script_rotate_point_y,
    o.thrust_scale3x[i],o.thrust_scale3y[i],
    o.direction+o.thrustangle[i],
    o.thrustcolor,o.thrust_scale3a[i]
   );
  }
 }
 draw_set_blend_mode(bm_normal);
}

