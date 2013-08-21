var w,result;
w=argument0;
result= ( global.player_fired[w] == 0 
 or (global.frame_number-global.player_fired[w]) > global.weapon_rate[w] );
if ( result ) {
 global.player_fired[w]=global.frame_number;
}
return result;
