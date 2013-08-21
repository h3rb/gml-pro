var sprite,i;
sprite=argument0;
for ( i=0; i<global.ship_profiles; i++ ) if ( global.ship_profile_sprite[i] == sprite ) return i;
return -1;
