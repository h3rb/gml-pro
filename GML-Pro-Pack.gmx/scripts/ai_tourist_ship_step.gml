var o;
o=argument0;
if ( o.waiting_for > 0.0 ) {  // We are waiting at a waypoint.
 o.waiting_for-=1/room_speed;
 if ( o.waiting_for <= 0.0 ) { // Ready to embark
  ai_SetCourseTouring(o.id); // Set course to next destination
  // Range
  var targetDistance;
  targetDistance=dist2d(o.x,o.y,o.destination.x,o.destination.y);
  if ( targetDistance < 500.0 ) { // "Arrival" (set course to current location)
   o.waiting_for=number_range(30,120);
  }// else audio_play_sound(sfx_Starliner_depart,100,0);
  o.waiting_for=0.0;
 } else { // Stopping (arrival)
  //Brake
  ai_Brake(o);
 }
} else { // We are attempting to reach a destination
 ai_Steer(o);
 
 ai_ThrustPedal(o);

 // Range
 var targetDistance;
 targetDistance=dist2d(o.x,o.y,o.moving_to_x,o.moving_to_y);

 if ( targetDistance < 500.0 ) { // Arrival
  o.waiting_for = number_range(10,60);
  //audio_play_sound(sfx_Starliner_arrival,100,0);
 }
}
