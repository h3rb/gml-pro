var ship_hp,ship_shields;
ship_hp=argument0;
ship_shields=argument1;
if ( ship_hp == 100 and ship_shields == 100 ) {
 return "Fully Operational";
}
if ( ship_hp == 100 and ship_shields > 75 ) {
 return "Shields Recovering";
}
if ( ship_hp == 100 and ship_shields > 35 ) {
 return "Shields Under Fire";
}
if ( ship_shields > 0 ) {
 return "Shields Failing";
}
if ( ship_hp > 75 ) {
 return "Sustained Minor Damage";
}
if ( ship_hp > 50 ) {
 return "Major Damaged Sustained";
}
if ( ship_hp > 25 ) {
 return "Heavily Damaged";
}
if ( ship_hp > 0 ) {
 return "Catastrophic Damage";
}
if ( ship_hp <= 0 ) {
 return "Destroyed";
}
