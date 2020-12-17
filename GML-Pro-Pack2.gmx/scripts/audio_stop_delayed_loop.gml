var i,new_loop,new_loop_count,new_loop_delay,new_loop_instance,new_;
i=argument0;
if ( i == noone or i >= global.cued_loops ) return noone;
new_loop[0]=0;;
new_loop_count[0]=0;
new_loop_delay[0]=0;
new_loop_instance[0]=noone;
new_=0;
var j;
for ( j=0; j<global.cued_loops; j++ ) {
 if ( j==i ) {
  if (  global.cued_loop_instance[j] != noone
    and audio_is_playing(global.cued_loop_instance[j])
  ) audio_stop_sound(global.cued_loop_instance[j]);
 } else {
  new_loop[new_]=global.cued_loop[j];
  new_loop_count[new_]=global.cued_loop_count[j];
  new_loop_delay[new_]=global.cued_loop_delay[j];
  new_loop_instance[new_]=global.cued_loop_instance[j];
  new_+=1;
 }
}
global.cued_loops-=1;
for ( j=0; j<global.cued_loops; j++ ) {
 global.cued_loop[j]=new_loop[j];
 global.cued_loop_count[j]=new_loop[j];
 global.cued_loop_delay[j]=new_loop_delay[j];
 global.cued_loop_instance[j]=new_loop_instance[j];
}
