var ship;
ship=argument0;
for ( i =0; i<ship.damage_w; i++ ) {
 ship.shipfx_probe_x+=1;
 if ( ship.shipfx_probe_x >= ship.damage_w ) {
  ship.shipfx_probe_x=0;
  ship.shipfx_probe_y+=1;
  if ( ship.shipfx_probe_y >= ship.damage_h ) ship.shipfx_probe_y=0;
 } 
 if ( ship.damage[ship.shipfx_probe_x,ship.shipfx_probe_y] != -666 ) shipfx_add_effect(ship);
}
