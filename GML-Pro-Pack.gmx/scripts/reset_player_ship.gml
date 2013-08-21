// Ship realities
global.player_turnspeed=1.75;
global.player_acceleration=0.02;
global.player_brakespeed=0.015;
global.player_maxvelocity=6.0;
global.player_afterburnspeed=10.0;
global.player_velocity=0.0;
global.player_scalefactor=0.1875;
global.player_turntime=0;
global.player_turning=false;
global.player_pitch_unit=global.player_scalefactor/100.0;
global.player_pitchdirection=0.0;
global.player_pitchlimit=25;
global.player_turnpitchspeed=0.25;
global.player_thrusting=false;
global.player_thrusttime=0;
global.player_x=0;
global.player_y=0;

global.player_ship_hp=100;
global.player_ship_shields=100;

global.player_ship_system_lifesupport=100;
global.player_ship_system_engines=100;
global.player_ship_system_cpu=100;
global.player_ship_system_medical=100;
global.player_ship_system_defense=100;
global.player_ship_system_offense=100;
global.player_ship_system_hyperdrive=100;
global.player_ship_system_sensors=100;
global.player_ship_system_nonessential=100;

global.player_ship_repair_nanites=100;

global.player_ship_cargo[0,0]=100;

global.player_weapon=0;

// Has the player found the weapon?
global.player_weapon_has[0]=true; // etc

for (  i=0; i<global.weapons; i++ ) {
 // What is the ammo for the weapon?
 global.player_ammo[i]=-1; // -1 means infinite
 // Weapon cooldown timer
 global.player_fired[i]=0;
}

// What is the ammo for the weapon?
global.player_ammo[3]=0; //seeker missiles

global.player_friction=0.01;
