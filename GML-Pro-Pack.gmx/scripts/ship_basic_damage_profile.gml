var o;
o=argument0;

var r,i,j;

spid=find_ship_profile(sprite_index);
targetinfo=noone; // an object that is attached to this ship that is for HUD

o.shields=100;
o.totalshields=100;
o.hitpoints=1000;
o.totallife=1000;

o.team=argument1;
o.lasthit=240;
o.statusdelay=240;
o.heatdiss=1; // heat dissapation
o.elecres=1; // electrical resistance
o.acidres=1; // acid resistance
o.radres=1; // radiation resistance
o.overloading=100;
o.overloadrate=10;
o.overloadspeed=10;
o.overloadspeeddecrease=0.1;
o.overloaddecrease=1;
o.staticdischaring=true;
o.nanorepairing=true;
o.ejections_total=0;

// Init systemic damage profile, corresponds to o.sectiontype[x,y] in damage profile
o.systems[0]=100; // general crew decks ("life support")
o.systems[1]=100; // engines
o.systems[2]=100; // power grid
o.systems[3]=100; // navigation
o.systems[4]=100; // cargo

// Build a percentile copy of the grid
// Build a heat/cold grid
st_vec2d_get(global.ship_profile_vec[spid]);
o.damage_w=global.vec_x;
o.damage_h=global.vec_y;
o.damage[0,0]=0;
o.heatcold[0,0]=0;
o.melted[0,0]=0;
o.melted_sprite[0,0]=noone;
o.melted_num[0,0]=0;
o.static[0,0]=0;
o.electrified[0,0]=0;
o.acid[0,0]=0;
o.acidized[0,0]=0;
o.radiation[0,0]=0;
o.irradiated[0,0]=0;
o.ejections[0,0]=0;
o.ejection_alpha[0,0]=0;
o.sectiontype[0,0]=0;
o.totalrads=0;
for ( i=0; i<global.vec_x; i++ ) for ( j=0; j<global.vec_y; j++ ) {
 r=sa_get(global.ship_profile[spid],i,j);
 o.sectiontype[i,j]=0; // default to "general crew decks" draw on this later
 if ( r == 1 ) {
  o.melted[i,j]=0;
  o.melted_sprite[i,j]=noone;
  o.melted_num[i,j]=0;
  o.ejections[i,j]=0;
  o.ejection_alpha[i,j]=0;
  o.heatcold[i,j]=0;
  o.acid[i,j]=0;
  o.acidized[i,j]=0;
  o.radiation[i,j]=0;
  o.irradiated[i,j]=0;
  o.static[i,j]=0;
  o.electrified[i,j]=0;
  o.damage[i,j]=100;
 } else {
  o.melted[i,j]=-666;
  o.melted_sprite[i,j]=noone;
  o.melted_num[i,j]=-666;
  o.ejections[i,j]=-666;
  o.ejection_alpha[i,j]=0;
  o.heatcold[i,j]=-666;
  o.acid[i,j]=-666;
  o.acidized[i,j]=-666;
  o.radiation[i,j]=-666;
  o.irradiated[i,j]=-666;
  o.static[i,j]=-666;
  o.electrified[i,j]=-666;
  o.damage[i,j]=-666;
 }
}
o.shipfx_probe_x=0;
o.shipfx_probe_y=0;
