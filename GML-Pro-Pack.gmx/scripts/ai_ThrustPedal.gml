var o;
o=argument0;

 // Thrust
if ( o.sincethrust > 0.0 ) o.sincethrust-=1/room_speed;
if ( o.systems[1] <= 0 ) { // Engines are disabled.
 o.thrusting=false;
 ai_Brake(o);
} else {
 if ( o.velocity < o.maxvelocity ) {
  if ( o.sincethrust <= 0.0 ) {
   if ( not is_behind(o.x,o.y,o.direction,o.destination.x,o.destination.y,90) ) {
    o.velocity+=o.accel;
    o.thrusting=true;
   } else {
    ai_Brake(o);
   }
  }
 } else {
  if ( o.sincethrust <= 0.0 ) o.sincethrust=number_range(0.0,o.helmsman_pedal_foot);
  ai_Brake(o);
 }
}
