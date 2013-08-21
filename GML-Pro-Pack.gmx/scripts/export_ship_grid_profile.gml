var sprite,surface,c,a,i,j,gw,gh;
sprite=argument0; // sprite
gw=argument1;
gh=argument2;
surface=surface_create(gw,gh); // surface (should be < 240x240)
surface_set_target(surface);
draw_clear_alpha(c_black,0);
draw_sprite_stretched(sprite,0,0,0,gw,gh);
for ( i=0; i<gw; i++ ) {
 for ( j=0; j<gh; j++ ) {
  if ( surface_get_alpha(surface,i,j) < 1.0 ) global.script_array2[i,j]=0;
  else global.script_array2[i,j]=1;
 }
}
surface_free(surface);
