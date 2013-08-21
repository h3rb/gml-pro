var o;
o=argument0;

// find new target
if ( o.attacking == noone ) {
 o.next_next_closest_enemy=noone;
 o.next_closest_enemy=noone;
 o.closest_enemy=noone;
 var i,d;
 d=10000;
 for ( i=0; i<instance_count; i++ ){
  var iid;
  iid=instance_id[i];
  if ( instance_exists(iid) ) {
   if ( is_starship(iid.object_index) or iid.object_index == o_player ) {
    if ( o.team != iid.team ) {
     var p;
     p=dist2d(o.x,o.y,iid.x,iid.y);
     if ( d > p ) {
      d=p;
      o.next_next_closest_enemy=o.next_closest_enemy;
      o.next_closest_enemy=o.closest_enemy;
      o.closest_enemy=iid;
     }
     o.attacking=iid;
    }
   }
  }
 }
}

