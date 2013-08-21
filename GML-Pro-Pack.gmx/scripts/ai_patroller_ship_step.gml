var o;
o=argument0;

ai_Touring(o);

ai_TargetNearestEnemy(o); //1Enemy(o);
if ( o.attacking != noone ) {
 o.destination=o.attacking;
}

// Target and fire at position
if ( o.attacking != noone ) {
 if ( instance_exists(o.attacking) ) {
  for ( i=0; i<hardpoints; i++ ) {
   if ( random(1) > 5 ) o.hardpoint_target[i]=o.attacking;
   else o.hardpoint_target[i]=o.closest_enemy;
  }
 } else {
  for ( i=0; i<hardpoints; i++ ) {
   o.hardpoint_target[i]=noone;
  }
  o.attacking = noone;
  ai_patroller_ship_set_course(o.id); // Set course to next destination
 }
}
