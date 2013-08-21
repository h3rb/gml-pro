var o;
o=argument0;

// Draw Lights

var i,tcolor;

for ( i=0; i<o.lights; i++ ) {
 st_vec2d_get(o.light[i]);
 rotate_point(-degtorad(o.image_angle),global.vec_x,global.vec_y);
 global.script_rotate_point_x+=x;
 global.script_rotate_point_y+=y;
 o.light_sub[i]+=o.light_dsub[i];
 if ( o.light_sub[i] > sprite_get_number(o.light_sprite[i]) ) o.light_sub[i]=0;
 o.light_instant[i]+=1/room_speed;
 if ( o.light_instant[i] >= o.light_duration[i] ) o.light_instant[i]=0.0;
 o.light_rotation[i]+=o.light_spin[i];
 o.light_alpha[i]=tween(o.light_tween[i],o.light_instant[i]/o.light_duration[i]);
 if ( o.light_blend[i] == bm_add ) {
  tcolor=ScaleByAlpha(o.light_color[i],o.light_alpha[i]);
  draw_set_blend_mode(o.light_blend[i]);
  draw_sprite_ext(
   o.light_sprite[i],o.light_sub[i],
   global.script_rotate_point_x,global.script_rotate_point_y,
   o.light_scale[i],o.light_scale[i],
   o.light_rotation[i],tcolor,o.light_alpha[i]
  );
 } else {
  draw_set_blend_mode(light_blend[i]);
  draw_sprite_ext(
   o.light_sprite[i],o.light_sub[i],
   global.script_rotate_point_x,global.script_rotate_point_y,
   o.light_scale[i],o.light_scale[i],
   o.light_rotation[i],o.light_color[i],o.light_alpha[i]
  );
 }
}
draw_set_blend_mode(bm_normal);

