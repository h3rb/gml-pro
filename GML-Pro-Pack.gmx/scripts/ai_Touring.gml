var o;
o=argument0;
var targetDistance;
if ( valid_instance(o.destination) ) targetDistance=dist2d(o.x,o.y,o.destination.x,o.destination.y);
else targetDistance=0.0;
if ( o.waiting_for > 0.0 ) {  // We are waiting at a waypoint.
 o.waiting_for-=1/room_speed;
 if ( o.waiting_for <= 0.0 ) { // Ready to embark
  ai_SetCourseTouring(o.id); // Set course to next destination
  // Range
  if ( targetDistance < 500.0 ) { // "Arrival" (set course to current location)
   o.waiting_for=number_range(30,120);
  }// else audio_play_sound(sfx_Starliner_depart,100,0);
  o.waiting_for=0.0;
 } else { // Stopping (arrival)
  ai_Brake(o);
 }
} else if ( o.destination != noone ) { // We are attempting to reach a destination
 if ( instance_exists(o.destination) ) {
  ai_Steer(o);
  ai_ThrustPedal(o);
  // Range
  if ( targetDistance < 100.0 ) { // Arrival
   if ( o.attacking == noone )  o.waiting_for = number_range(10,60);
   else o.waiting_for=2;
  //audio_play_sound(sfx_Starliner_arrival,100,0);
  }
 } else o.destination=noone;
}
