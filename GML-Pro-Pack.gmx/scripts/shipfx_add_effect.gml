var ship,damage,i,j;
ship=argument0;
i=ship.shipfx_probe_x;
j=ship.shipfx_probe_y;
damage=ship.damage[i,j];

// Delta temperature
if ( ship.heatcold[i,j] > 0 ) {
 ship.heatcold[i,j]-=ship.heatdiss;
} else if ( ship.heatcold[i,j] < 0 ) {
 ship.heatcold[i,j]+=ship.heatdiss;
}
// Delta acid
if ( ship.heatcold[i,j] > 0 ) {
 ship.heatcold[i,j]-=ship.heatdiss;
} else if ( ship.heatcold[i,j] < 0 ) {
 ship.heatcold[i,j]+=ship.heatdiss;
}
// Delta electrification
if ( ship.static[i,j] > 0 ) {
 ship.static[i,j]-=ship.elecres;
} else if ( ship.static[i,j] < 0 ) {
 ship.static[i,j]=0;
}
// Delta acidification
if ( ship.acid[i,j] > 0 ) {
 ship.acid[i,j]-=ship.acidres;
} else if ( ship.acid[i,j] < 0 ) {
 ship.acid[i,j]=0;
}
// Delta radiation
if ( ship.radiation[i,j] > 0 ) {
 ship.radiation[i,j]-=ship.radres;
 totalrads-=ship.radres;
 if ( totalrads < 0 ) totalrads=0;
} else if ( ship.radiation[i,j] < 0 ) {
 ship.radiation[i,j]=0;
}

// Add effects such as venting gas, electrical discharge, using the explosion manager...

if ( ship.heatcold[i,j] > 60 and random(100) < 2 ) {
 vec=shipfx_grid_screen_xy(
  ship.x,ship.y,
  ship.image_angle,
  sprite_get_width(ship.sprite_index)*ship.image_xscale,
  sprite_get_height(ship.sprite_index)*ship.image_yscale,
  i,j,
  ship.damage_w,ship.damage_h);
 st_vec2d_get(vec);
 request_smokepuff(global.vec_x,global.vec_y,4,ship.dx,ship.dy);
}

if ( hitpoints < 0 and ship.heatcold[i,j] < 273/2 and random(100) < 2 ) {
 vec=shipfx_grid_screen_xy(
  ship.x,ship.y,
  ship.image_angle,
  sprite_get_width(ship.sprite_index)*ship.image_xscale,
  sprite_get_height(ship.sprite_index)*ship.image_yscale,
  i,j,
  ship.damage_w,ship.damage_h);
 st_vec2d_get(vec);
 request_smokepuff(global.vec_x,global.vec_y,5,ship.dx,ship.dy);
}

if ( ship.heatcold[i,j] > 60 and ship.heatcold[i,j] < 273/2 and random(100) < 2 ) {
 vec=shipfx_grid_screen_xy(
  ship.x,ship.y,
  ship.image_angle,
  sprite_get_width(ship.sprite_index)*ship.image_xscale,
  sprite_get_height(ship.sprite_index)*ship.image_yscale,
  i,j,
  ship.damage_w,ship.damage_h);
 st_vec2d_get(vec);
 request_smokepuff(global.vec_x,global.vec_y,5,ship.dx,ship.dy);
}

if ( ship.heatcold[i,j] < -60 and random(100) < 2 ) { // ice steam
 vec=shipfx_grid_screen_xy(
  ship.x,ship.y,
  ship.image_angle,
  sprite_get_width(ship.sprite_index)*ship.image_xscale,
  sprite_get_height(ship.sprite_index)*ship.image_yscale,
  i,j,
  ship.damage_w,ship.damage_h);
 st_vec2d_get(vec);
 request_smokepuff(global.vec_x,global.vec_y,7,ship.dx,ship.dy);
}

if ( ship.static[i,j] > 0 and random(100) < 2 ) {
 vec=shipfx_grid_screen_xy(
  ship.x,ship.y,
  ship.image_angle,
  sprite_get_width(ship.sprite_index)*ship.image_xscale,
  sprite_get_height(ship.sprite_index)*ship.image_yscale,
  i,j,
  ship.damage_w,ship.damage_h);
 st_vec2d_get(vec);
 request_smokepuff(global.vec_x,global.vec_y,6,ship.dx,ship.dy);
} else
if ( ship.overloading > 0 and random(100) < ship.overloadspeed ) {
 vec=shipfx_grid_screen_xy(
  ship.x,ship.y,
  ship.image_angle,
  sprite_get_width(ship.sprite_index)*ship.image_xscale,
  sprite_get_height(ship.sprite_index)*ship.image_yscale,
  i,j,
  ship.damage_w,ship.damage_h);
 st_vec2d_get(vec);
 request_smokepuff(global.vec_x,global.vec_y,6,ship.dx,ship.dy);
}

if ( ship.acid[i,j] > 0 and random(100) < 2 ) {
 vec=shipfx_grid_screen_xy(
  ship.x,ship.y,
  ship.image_angle,
  sprite_get_width(ship.sprite_index)*ship.image_xscale,
  sprite_get_height(ship.sprite_index)*ship.image_yscale,
  i,j,
  ship.damage_w,ship.damage_h);
 st_vec2d_get(vec);
 request_smokepuff(global.vec_x,global.vec_y,8,ship.dx,ship.dy);
} 

if ( ship.radiation[i,j] > 0 and random(100) < 2 ) {
 vec=shipfx_grid_screen_xy(
  ship.x,ship.y,
  ship.image_angle,
  sprite_get_width(ship.sprite_index)*ship.image_xscale,
  sprite_get_height(ship.sprite_index)*ship.image_yscale,
  i,j,
  ship.damage_w,ship.damage_h);
 st_vec2d_get(vec);
 request_smokepuff(global.vec_x,global.vec_y,9,ship.dx,ship.dy);
}

if ( ship.ejections[i,j] > 0 and random(100) < 20 ) {
 vec=shipfx_grid_screen_xy(
  ship.x,ship.y,
  ship.image_angle,
  sprite_get_width(ship.sprite_index)*ship.image_xscale,
  sprite_get_height(ship.sprite_index)*ship.image_yscale,
  i,j+1,
  ship.damage_w,ship.damage_h);
 st_vec2d_get(vec);
 request_smokepuff(global.vec_x,global.vec_y,11,ship.dx,ship.dy);
}
//show_message("Adding...");
