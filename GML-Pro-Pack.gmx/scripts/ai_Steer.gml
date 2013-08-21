var o;
o=argument0;

if ( o.destination != noone ) {
 if ( instance_exists(o.destination) ) {
  // Steering
  var degrees,angle;
  degrees=norm_deg((LineAngle(o.x,o.y,o.destination.x,o.destination.y))+270);
  angle=norm_deg(o.direction);
  if ( not is_near(angle,degrees,o.turnSpeed) ) {
   if ( angle > degrees ) o.turning=-o.turnSpeed;
   else
   if ( angle < degrees ) o.turning=o.turnSpeed;
   else o.turning=0.0;
  } else o.turning=0.0;
 }
}
