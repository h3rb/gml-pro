var o;
o=argument0;
if ( o.colliding==noone ) {
 if ( o.collided==noone ) {
  o.colliding=argument1;
  with ( o ) { collided=collision_circle(x,y,collision_radius,colliding,true,false); }
  if ( o.collided<0 ) {
   o.colliding=noone;
   o.collided=noone;
  }
 }
}
