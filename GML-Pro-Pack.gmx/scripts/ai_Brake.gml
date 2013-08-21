var o;
o=argument0;

//Brake
o.thrusting=false;
if ( o.velocity > 0.0 ) o.velocity -=o.decel;
if ( o.velocity < 0.0 ) o.velocity=0.0;
