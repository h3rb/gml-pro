
var o,i,
 ofsx,ofsy,
 weapon_type,
 mounting,mode,
 munitions,
 rest_angle,
 scale,tint,
 muzzle_flash_blend,
 muzzle_flash_sprite,
 muzzle_flash_scale,
 muzzle_flash_sub,
 muzzle_flash_dsub;
// Note: unsupported options that can be set later: muzzle_flash_tint, muzzle_flash_randomsub,
// muzzle_flash_contractsub, weapon_range
o=argument0;
i=argument1;

ofsx=argument2;
ofsy=argument3;

weapon_type=argument4; // 0=projectile (blaster), 1=beam weapon
mounting=argument5; // can be noone
mode=argument6; // 0=asynchronous (chained) fire, 1=synchronous
munitions=argument7; // contains a numeric code that signals o_weapon1 how to act
rest_angle=argument8;
scale=argument9;
tint=argument10;

muzzle_flash_blend=argument11;
muzzle_flash_sprite=argument12;
muzzle_flash_scale=argument13;
muzzle_flash_sub=argument14;
muzzle_flash_dsub=argument15;

o.hardpoint[i]=st_vec2d_set(ofsx,ofsy);
o.hardpoint_type[i]=weapon_type;
o.mount[i]=mounting;
o.mount_firing_mode[i]=mode;
o.munitions[i]=munitions;
o.rest_angle[i]=norm_deg(rest_angle);
o.mount_angle[i]=rest_angle;
o.mount_scale[i]=scale;
o.mount_color[i]=tint;
o.muzzle_flash_blend[i]=muzzle_flash_blend;
o.muzzle_flash_sprite[i]=muzzle_flash_sprite;
o.muzzle_flash_scale[i]=muzzle_flash_scale;
o.muzzle_flash_sub[i]=muzzle_flash_sub;
o.muzzle_flash_dsub[i]=muzzle_flash_dsub;
o.muzzle_flash_tint[i]=c_white;
o.muzzle_flash_randomsub[i]=true;
o.muzzle_flash_contractscale[i]=true;
o.muzzle_flash_angle[i]=0.0;
o.muzzle_duration[i]=0.15;
o.muzzle_instant[i]=o.muzzle_duration[i];
o.hardpoint_target[i]=noone;
o.mount_trigger[i]=false;
if ( o.mount[i] != noone ) {
 o.mount_speed[i]=get_weapon_speed(o.mount[i]);
 o.emis_points[i]=get_emission_points(o.mount[i]);
 o.emis_total[i]=st_pointstack_size(o.emis_points[i]);
} else {
 o.mount_speed[i]=1.0;
 o.emis_points[i]="";
 o.emis_total[i]=0;
}
o.active_emitter[i]=0;
o.cooldown_period[i]=20;
o.cooldown_instant[i]=0;
o.weapon_range[i]=get_weapon_range(o.mount[i],o.munitions[i]);
o.hp_turn_speed[i]=1.0;
o.hp_turn_accel[i]=0.5;
o.hp_turn_speed_max[i]=3.0;
o.hp_turn_fric[i]=0.1;
o.hp_energy_cost[i]=1.0;
