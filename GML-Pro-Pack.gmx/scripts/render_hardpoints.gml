var o;
o=argument0;

// Draw Hardpoints

var i,omx,omy,a,percent,scaled,muzx,muzy;

for ( i=0; i<o.hardpoints; i++ ) {
 st_vec2d_get(o.hardpoint[i]);
 rotate_point(-degtorad(o.image_angle),global.vec_x,global.vec_y);
 global.script_rotate_point_x+=x;
 global.script_rotate_point_y+=y;
 draw_sprite_ext(o.mount[i],0,
  global.script_rotate_point_x, global.script_rotate_point_y,
  o.mount_scale[i], o.mount_scale[i],
  o.image_angle+o.mount_angle[i]-90+180, o.mount_color[i], 1.0
 );
 // Draw Muzzle Flash
 if ( o.muzzle_instant[i] < o.muzzle_duration[i] ) {
//  st_vec2d_get(o.hardpoint[i]);
//  rotate_point(-degtorad(o.image_angle),global.vec_x,global.vec_y);
  omx=global.script_rotate_point_x;
  omy=global.script_rotate_point_y;
  st_vec2d_get(st_pointstack_get(o.emis_points[i],o.active_emitter[i]));
  a=360-norm_deg(o.mount_angle[i]+o.image_angle)+90+180;
  rotate_point(degtorad(a),global.vec_x,global.vec_y);  
  draw_set_blend_mode(o.muzzle_flash_blend[i]);
  percent=o.muzzle_instant[i]/o.muzzle_duration[i];
  if ( o.muzzle_flash_contractscale[i] ) scaled=(1-percent)*o.muzzle_flash_scale[i];
  else scaled=o.muzzle_flash_scale[i];
  draw_sprite_ext(o.muzzle_flash_sprite[i],
   o.muzzle_flash_sub[i],
   omx+global.script_rotate_point_x,
   omy+global.script_rotate_point_y,
   scaled,scaled,
   o.muzzle_flash_angle[i]+(o.mount_angle[i]+o.image_angle-90)+180,
   o.muzzle_flash_tint[i],
   percent
  );
  draw_set_blend_mode(bm_normal);
  o.muzzle_instant[i]+=1/room_speed;
  o.muzzle_flash_sub[i]+=o.muzzle_flash_dsub[i];
 }
}

