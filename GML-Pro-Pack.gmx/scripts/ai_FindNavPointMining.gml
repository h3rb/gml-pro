var o,ids,distances,i,found,rpick;
// Query target depending on current capacity.
o=argument0;
found=0;
if ( o.cargo==o.capacity*0.8 ) { // Return and discard cargo
 for ( i=0; i<instance_count; i++ ) {
  var iid;
  iid=instance_id[i];
  if ( o != iid and instance_exists(iid) ) {
   if ( iid.object_index == o_ai_planetoid
     or iid.object_index == o_ai_moon
     or iid.object_index == o_ai_ufse_starbase ) {
    ids[found]=iid;
    distances[found]=dist2d(iid.x,iid.y,o.x,o.y);
    found++;
   }
  } 
 }
} else { // Find another asteroid
 for ( i=0; i<instance_count; i++ ) {
  var iid;
  iid=instance_id[i];
  if ( o != iid and instance_exists(iid) ) {
   if ( iid.object_index == o_ai_planetoid
     or iid.object_index == o_ai_moon
     or iid.object_index == o_ai_ufse_starbase ) {
    ids[found]=iid;
    distances[found]=dist2d(iid.x,iid.y,o.x,o.y);
    found++;
   }
  }
 }
}
if ( found == 0 ) return noone;
var done,attempts,selected;
attempts=0;
done=false;
selected=0;
if ( found > 1 ) {
 while( !done and attempts < 10 ) {
  selected=number_range(0,found);
  if ( found == selected ) selected-=1;
  attempts+=1;
  if ( distances[selected] > argument1 ) done=true;
 }
}
if ( attempts >= 10 ) return noone;
return ids[selected];
