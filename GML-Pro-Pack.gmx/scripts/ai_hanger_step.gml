var o;
o=argument0;
var i;
for ( i=0; i<o.hangers; i++ ) {
 if ( o.hanger_instant[i] > 0.0 ) {
  o.hanger_instant[i]-=1/room_speed;
  if ( o.hanger_instant[i] < 0.0 ) o.hanger_instant[i]=0.0;
 }
}

