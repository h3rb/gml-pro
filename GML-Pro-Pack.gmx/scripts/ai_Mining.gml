var o;
o=argument0;
if ( o.waiting_for > 0.0 ) {  // We are waiting at a waypoint.
 o.waiting_for-=1/room_speed;
 if ( o.waiting_for <= 0.0 ) { // Ready to embark
  ai_SetCourseMining(id); // Set course to next destination
  // Range
  var targetDistance;
  targetDistance=dist2d(x,y,o.moving_to_x,o.moving_to_y);
  if ( targetDistance < 500.0 ) { // "Arrival" (set course to current location)
   o.waiting_for=number_range(30,120);
  }// else audio_play_sound(sfx_Starliner_depart,100,0);
  o.waiting_for=0.0;
 } else { // Stopping (arrival)
  //Brake
  o.thrusting=false;
  if ( o.velocity > 0.0 ) o.velocity -=o.decel;
  if ( o.velocity < 0.0 ) o.velocity=0.0;
 }
} else { // We are attempting to reach a destination
 // Steering
 var degrees,angle;
 degrees=norm_deg((LineAngle(x,y,o.moving_to_x,o.moving_to_y))+270);
 angle=norm_deg(direction);
 if ( not is_near(angle,degrees,o.turnSpeed) ) {
  if ( angle > degrees ) o.turning=-o.turnSpeed;
  else
  if ( angle < degrees ) o.turning=o.turnSpeed;
  else o.turning=0.0;
 } else o.turning=0.0;
 
 // Thrust
 if ( o.sincethrust > 0.0 ) o.sincethrust-=1/room_speed;
 if ( o.velocity < o.maxvelocity and o.sincethrust <= 0.0 ) {
  o.velocity+=o.accel;
  o.thrusting=true;
 } else {
  if ( o.sincethrust <= 0.0 ) o.sincethrust=number_range(0.0,o.helmsman_pedal_foot);
  o.thrusting=false;
  if ( o.velocity > 0.0 ) o.velocity-=o.decel/10;
  else if ( o.velocity < 0.0 ) o.velocity=0.0;
 }

 // Range
 var targetDistance;
 targetDistance=dist2d(x,y,o.moving_to_x,o.moving_to_y);

 if ( targetDistance < 500.0 ) { // Arrival
  o.waiting_for = number_range(10,60);
  //audio_play_sound(sfx_Starliner_arrival,100,0);
 }
}
