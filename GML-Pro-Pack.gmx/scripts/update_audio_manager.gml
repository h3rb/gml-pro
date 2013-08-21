var j;
for ( j=0; j<global.cued_loops; j++ ) {
 if ( global.cued_loop_delay[j] > 0.0 /*and global.cued_loop_instance[j] == noone*/ ) {
  global.cued_loop_delay[j]-=1/room_speed;
  if ( global.cued_loop_delay[j] <= 0.0 ) {
   global.cued_loop_instance[j]=audio_play_sound(global.cued_loop[j],100,global.cued_loop_count[j]);
  }
 }
}
