var o;
o=argument0;

// Hardpoint Gunner AI
// http://stackoverflow.com/questions/4107403/ai-algorithm-to-shoot-at-a-target-in-a-2d-game
// http://stackoverflow.com/questions/2248876/2d-game-fire-at-a-moving-target-by-predicting-intersection-of-projectile-and-u

var
 mount_emission_x,mount_emission_y,
 obj_mount_emission_x,obj_mount_emission_y,
 obj_mount_x,obj_mount_y,
 target_range,
 projectile_time,
 tnex,tney,
 b,
 i;

for ( i=0; i<o.hardpoints; i++ ) {
 o.cooldown_instant[i] -= 1;
 if ( o.cooldown_instant[i] < 0 ) o.cooldown_instant[i]=0;
 o.hp_turn_speed[i]*=(1-o.hp_turn_fric[i])
 if ( !instance_exists(o.hardpoint_target[i]) ) o.hardpoint_target[i]=noone;
 if ( o.hardpoint_target[i] == noone ) { // Turn back toward resting position
 
   
  o.hp_turn_speed[i]=smooth_turn(o.mount_angle[i],o.rest_angle[i],
   o.hp_turn_accel[i],
   o.hp_turn_fric[i],
   o.hp_turn_speed_max[i],
   o.hp_turn_speed[i]
  );
  
//  o.mount_angle[i]+=smooth_turn(o.mount_angle[i],o.rest_angle[i],0.5,0.1,3.0,1.0);
/*  if ( o.mount_angle[i] < o.rest_angle[i] ) {
   o.mount_angle[i]+=0.1;
   if ( o.mount_angle[i] > o.rest_angle[i] ) o.mount_angle[i] = o.rest_angle[i];
  } else if ( o.mount_angle[i] > o.rest_angle[i] ) {
   o.mount_angle[i]-=0.1;
   if ( o.mount_angle[i] < o.rest_angle[i] ) o.mount_angle[i] = o.rest_angle[i];
  }*/
 } else if ( o.hardpoint_type[i] == 0 ) { // Aim toward an existing target, fire if can hit.
  st_vec2d_get(o.hardpoint[i]);
  rotate_point(-degtorad(o.image_angle),global.vec_x,global.vec_y);
  obj_mount_x=x+global.script_rotate_point_x;
  obj_mount_y=y+global.script_rotate_point_y;
  target_range=dist2d(obj_mount_x,obj_mount_y,
   o.hardpoint_target[i].x,
   o.hardpoint_target[i].y
  );
  projectile_time=target_range/o.mount_speed[i];
  tnex=o.hardpoint_target[i].x+projectile_time*o.hardpoint_target[i].dx;
  tney=o.hardpoint_target[i].y+projectile_time*o.hardpoint_target[i].dy;
  var ta;
  ta=(
   LineAngle(obj_mount_x,obj_mount_y,
//    hardpoint_target[i].x,hardpoint_target[i].y
    tnex,tney
   )-o.image_angle
  );
  
  o.hp_turn_speed[i]=smooth_turn(o.mount_angle[i],ta,
   o.hp_turn_accel[i],
   o.hp_turn_fric[i],
   o.hp_turn_speed_max[i],
   o.hp_turn_speed[i]
  );

  /*
  if ( o.mount_angle[i] < ta ) {
   o.mount_angle[i]+=1.0;
   if ( o.mount_angle[i] > ta ) o.mount_angle[i] = ta;
  } else if ( o.mount_angle[i] > ta ) {
   o.mount_angle[i]-=1.0;
   if ( o.mount_angle[i] < ta ) o.mount_angle[i] = ta;
  }
  */
  if ( target_range > o.weapon_range[i] ) {   // decide on new target?
  } else if ( o.cooldown_instant[i] <= 0 ) {    // fire 
   o.active_emitter[i]+=1; // Asynchronous
   if ( o.active_emitter[i] >= o.emis_total[i] ) o.active_emitter[i]=0;
   o.cooldown_instant[i]=o.cooldown_period[i];
   st_vec2d_get(st_pointstack_get(o.emis_points[i],o.active_emitter[i]));
   rotate_point(degtorad(360-norm_deg(o.mount_angle[i]+o.image_angle)+90+180),global.vec_x,global.vec_y);
   b=generate_weapon(o,
    obj_mount_x+global.script_rotate_point_x,
    obj_mount_y+global.script_rotate_point_y,
    mount_angle[i]+o.image_angle+90+180+180,
    mount_speed[i],
    o.munitions[i], o.mount[i]
   );
   generate_burst(b);
   // Reset the muzzle flash for this weapon
   o.muzzle_instant[i]=0.0;
   if ( o.muzzle_flash_randomsub[i] ) o.muzzle_flash_sub[i]=random(sprite_get_number(o.muzzle_flash_sprite[i]));   
 /*draw_line_color(
   hardpoint_target[i].x,
   hardpoint_target[i].y,
   obj_mount_x,
   obj_mount_y,
   c_red,c_green
  );
  draw_line_color(
   tnex,tney,
   obj_mount_x,
   obj_mount_y,
   c_orange,c_blue
  );*/    
  }
  o.mount_angle[i]+=o.hp_turn_speed[i];
 }
}


