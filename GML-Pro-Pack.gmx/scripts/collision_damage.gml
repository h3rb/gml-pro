var o,i;
// once per frame
o=argument0;
o.lasthit+=1;
if ( o.hit>0 ) {
 for ( i=0; i<o.hit; i++ ) {
  if ( o.shields > 0 ) o.shields-=o.hit_dam[i];
  else {
   o.hitpoints-=o.hit_dam[i];
   apply_grid_damage(o,i);
  }
 }
 o.hit=0;
 o.lasthit=0;
}
