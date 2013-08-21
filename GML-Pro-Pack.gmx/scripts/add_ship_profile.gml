var sprite,ecks,why,i;
sprite=argument0;
ecks=argument1;
why=argument2;

i=global.ship_profiles;

export_ship_grid_profile(sprite,ecks,why);
global.ship_profile[i]=sa_store(ecks,why);
global.ship_profile_sprite[i]=sprite;
global.ship_profile_vec[i]=st_vec2d_set(ecks,why);
//show_message(global.ship_profile_vec[i]);
st_vec2d_get(global.ship_profile_vec[i]);
//show_message(int(global.vec_x)+","+int(global.vec_y));
global.ship_profiles+=1;
