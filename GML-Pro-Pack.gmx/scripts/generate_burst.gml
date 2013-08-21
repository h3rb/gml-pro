// this routine modifies o and/or adds additional bullets like o

var o;
o=argument0; // first bullet fired, contains x,y,type

if ( o.requested == 6 ) { // Dual Hypercoil Blaster
 o.direction-=2.5;
 generate_weapon(o.shot_by,o.x,o.y,o.direction+5,o.shot_by.velocity,o.requested); 
} else if ( o.requested == 7 ) { // Spread Projector
 var sa,ta,a,da;
 sa=-10.0;
 ta=20.0;
 a=sa;
 da=ta/5;
 for ( i=0; i<5; i++ ) {
  if ( i!=2 ) { // i == 2 skips the original bullet created
   generate_weapon(o.shot_by,o.x,o.y,o.direction+fuzzy(a,5),o.shot_by.velocity,o.requested);
  }
  a+=da;
 }
} else if ( o.requested == 8 ) { // "Smart Bullets"
 o.direction=fuzzy(o.direction,3); // skew
// o.seeks=true;
} else if ( o.requested == 9 ) { // Flak Ejector
 for ( i=0; i<10; i++ ) {
  if ( i!=5 ) { // i == 2 skips the original bullet created
   var b;
   b=generate_weapon(o.shot_by,o.x,o.y,fuzzy(o.direction,5),o.shot_by.velocity,o.requested);
   b.velocity=fuzzy(b.velocity,1);
  }
 }
} else if ( o.requested == 10 ) { // Green Ion Cloud
 var total;
 total=random(7);
 for ( i=0; i<total; i++ ) {
  if ( i!=real(int(total/2)) ) { // i == 2 skips the original bullet created
   var b;
   b=generate_weapon(o.shot_by,o.x,o.y,fuzzy(o.direction,5),o.shot_by.velocity,o.requested);
   b.velocity=fuzzy(b.velocity,1);
  }
 }
} else if ( o.requested == 11 ) { // High ROF Flak Minigun
 for ( i=0; i<7; i++ ) {
  if ( i!=3 ) { // i == 2 skips the original bullet created
   var b;
   b=generate_weapon(o.shot_by,o.x,o.y,fuzzy(o.direction,5),o.shot_by.velocity,o.requested);
   b.velocity=fuzzy(b.velocity,1);
  }
 }
} else if ( o.requested == 14 ) { // Lightning Gun
 o.direction=fuzzy(o.direction,3); // skew
 o.velocity=fuzzy(o.velocity,1);
} else if ( o.requested == 15 ) {
 var sa,ta,a,da;
 sa=-180.0;
 ta=360.0;
 a=sa;
 da=ta/36;
 for ( i=0; i<36 i++ ) {
  if ( i!=17 ) { // i == 2 skips the original bullet created
   var b;
   b=generate_weapon(o.shot_by,o.x,o.y,a+fuzzy(o.direction,5),o.shot_by.velocity,o.requested);
   b.velocity=fuzzy(b.velocity,1);
  }
  a+=da;
 } 
}
