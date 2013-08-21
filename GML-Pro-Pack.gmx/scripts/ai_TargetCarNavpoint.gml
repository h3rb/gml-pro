var o;
o=argument0;

var findNew;
findNew=false;
if ( o.waitingAtIntersection <= 0.0 ) {
 if ( o.approaching != noone ) { 
  var ranged;
  ranged=dist2d(o.x,o.y,o.approaching.x,o.approaching.y);
  if ( ranged < closeness ) { // within range of current target object
   if ( o.approaching.stopsign != noone ) {
    o.targetspeed=0;
   } else if ( o.approaching.trafficlight != noone ) {
    if ( o.approaching.trafficlight.mode != 0 ) o.targetspeed=0;
   }
   if ( o.approaching.next != noone ) {
    o.approaching=o.approaching.next;
    o.wasApproaching=o.approaching;
   } else findNew=true;
  } //
 } else {
  o.wasApproaching=approaching;
  findNew=true;
 }
}

// find new target
if ( findNew ) {
 var i,d;
 d=10000;
 for ( i=0; i<instance_count; i++ ){
  var iid;
  iid=instance_id[i];
  if ( instance_exists(iid) ) {
   if ( iid.object_index == o_car_navpoint ) {
    if ( iid != o.approaching ) {
     if ( iid.point == 0 ) {
      var p;
      p=dist2d(o.x,o.y,iid.x,iid.y);
      if ( d > p ) {
       d=p;
       o.wasApproaching=o.approaching;
       o.approaching=iid;
      }
     }
    }
   }
  }
 }
}//
