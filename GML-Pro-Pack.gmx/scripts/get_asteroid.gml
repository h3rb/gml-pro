var o,v;
o=argument0;
v=argument1;
o.troid=v;
if ( v < 1 ) {
 o.animated=true;
 o.sprite=s_troid1;
 o.animspeed=1;
} else if ( v < 2 ) {
 o.animated=true;
 o.sprite=s_troid2;
 o.animspeed=1;
} else if ( v < 3 ) {
 o.animated=true;
 o.sprite=s_troid3;
 o.animspeed=0.5;
} else if ( v < 4 ) {
 o.animated=true;
 o.sprite=s_troid4;
 o.animspeed=0.5;
} else if ( v < 5 ) {
 o.animated=false;
 o.sprite=s_troid5_set;
 o.frame=real(int(random(sprite_get_number(s_troid5_set))));
 o.animspeed=0;
} else if ( v < 6 ) {
 o.animated=true;
 o.sprite=s_troid6;
 o.animspeed=0.5;
} else if ( v < 7 ) {
 o.animated=true;
 o.sprite=s_troid7;
 o.animspeed=0.5;
} else if ( v < 8 ) {
 o.animated=false;
 o.sprite=s_troid8_set;
 o.frame=real(int(random(sprite_get_number(s_troid8_set))));
 o.animspeed=0;
} else if ( v < 9 ) {
 o.animated=true;
 o.sprite=s_troid9;
 o.animspeed=0.5;
} else if ( v < 10 ) {
 o.animated=true;
 o.sprite=s_troid10;
 o.animspeed=1;
} else if ( v < 11 ) {
 o.animated=true;
 o.sprite=s_troid11;
 o.animspeed=1;
} else if ( v < 12 ) {
 o.animated=true;
 o.sprite=s_troid12;
 o.animspeed=1;
} else if ( v < 13 ) {
 o.animated=true;
 o.sprite=s_troid13;
 o.animspeed=0.5;
} else if ( v < 14 ) {
 o.animated=true;
 o.sprite=s_troid14;
 o.animspeed=0.25;
 o.scale=o.scale*(0.5+random(0.5));
} else if ( v < 15 ) {
 o.animated=true;
 o.sprite=s_troid15;
 o.animspeed=0.5;
} else if ( v < 16 ) {
 o.animated=true;
 o.sprite=s_troid16;
 o.animspeed=0.1;
} else if ( v < 17 ) {
 o.animated=false;
 o.sprite=s_troid17;
 o.animspeed=0;
 o.scale=o.scale*(0.5+random(0.5));
} else if ( v < 18 ) {
 o.animated=true;
 o.sprite=s_troid18;
 o.animspeed=0.2;
} else if ( v < 19 ) {
 o.animated=false;
 o.sprite=s_troid19;
 o.animspeed=0;
 o.scale=(o.scale*0.5+random(0.5));
} else if ( v < 20 ) {
 o.animated=false;
 o.sprite=s_troid20;
 o.animspeed=0;
 o.scale=(o.scale*0.5+random(0.5));
 o.depth=10;
 o.hitpoints=700;
} else if ( v < 21 ) {
 o.animated=false;
 o.sprite=s_troid21;
 o.animspeed=0;
 o.scale=(o.scale*0.5+random(0.5));
 o.depth=10;
 o.hitpoints=500;
} else { //if ( v < 22 ) {
 o.animated=false;
 o.sprite=s_troid22;
 o.animspeed=0;
 o.scale=(o.scale*0.5+random(0.5));
 o.fragments=false;
 o.depth=10;
 o.hitpoints=1000;
}

object_set_sprite(o.id,o.sprite); // sets the collision mask
