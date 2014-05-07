// Global sound channel emitter thingy
update_global_emitters();
// Radio feature
radio_update();
// Cued Loops feature (incomplete!)
var i,j;
for ( j=0; j<global.cued_loops; j++ ) {
 if ( global.cued_loop_delay[j] > 0.0 ) global.cued_loop_delay[j]-=1/room_speed;
 if ( global.cued_loop_delay[j] <= 0.0 ) {
   global.cued_loop_instance[j]=audio_play_sound(global.cued_loop[j],100,global.cued_loop_count[j]);
 }
}
// play_global_singleton() related stuff, remove from list after updating time
i=0;
for ( j=0; j<global.singletone_sounds; i++; ) {
 j++;
 global.singletone_duration[i]-=1/room_speed;
 if ( global.singletone_duration[i] < 0 ) {
  if ( global.singletone_sounds > 1 ) {
   if ( global.singletone_sounds-1 != j ) {
    global.singletone_sounds-=1;
    var k;
    for ( k=j; k<global.singletone_sounds; k++ ) {
     global.singletone_sound[k]=global.singletone_sound[k+1];
     global.singletone_duration[k]=global.singletone_duration[k+1];
    }
    j--;
   } else global.singletone_sounds--;
  } else {
    global.singletone_sounds=0;
  }
 }
}
// Audio Area 2D Emitter Manager
// Update and remove any expired emitters past expiry date
// Play any delayed sounds ready for cue
var cache_a2d_emissions=0;
var cache_a2d_emitter;
var cache_a2d_expired;
var cache_a2d_cued_priority;
var cache_a2d_cued_loops;
var cache_a2d_cued_duration;
var cache_a2d_cued_delay;
var cache_a2d_cued_sound;
var delta=1/room_speed;
var i,k;
for ( i=0; i<global.a2d_emissions; i++ ) {
 var copy=false;
 if ( audio_emitter_exists(global.a2d_emitter[i]) ) {
  if ( global.a2d_cued_delay[i] <= 0 ) {
   if ( global.a2d_cued_duration[i] != -1 ) global.a2d_expired[i]+=delta;
   if ( global.a2d_expired[i] >= global.a2d_cued_duration[i] ) {
    audio_emitter_free(global.a2d_emitter[i]);
   } else copy=true;
  } else {
   copy=true;
   global.a2d_cued_delay[i]-=delta;
   if ( global.a2d_cued_delay[i] <= 0.0 ) {
    play(
     global.a2d_cued_sound[i],
     global.a2d_cued_priority[i],
     global.a2d_cued_loops[i],
     global.a2d_cued_duration[i],
     global.a2d_emitter[i]
    );
   }
  }
 }
 if ( copy ) {
  k=cache_a2d_emissions;
  cache_a2d_emitter[k]      =global.a2d_emitter[i];
  cache_a2d_expired[k]      =global.a2d_expired[i];
  cache_a2d_cued_priority[k]=global.a2d_cued_priority[i];
  cache_a2d_cued_loops[k]   =global.a2d_cued_loops[i];
  cache_a2d_cued_duration[k]=global.a2d_cued_duration[i];
  cache_a2d_cued_delay[k]   =global.a2d_cued_delay[i];
  cache_a2d_cued_sound[k]   =global.a2d_cued_sound[i];
  cache_a2d_emissions++;
 } 
}
for ( i=0; i<cache_a2d_emissions; i++ ) {
 global.a2d_emitter[i]      = cache_a2d_emitter[i];
 global.a2d_expired[i]      = cache_a2d_expired[i];
 global.a2d_cued_priority[i]= cache_a2d_cued_priority[i];
 global.a2d_cued_loops[i]   = cache_a2d_cued_loops[i];
 global.a2d_cued_duration[i]= cache_a2d_cued_duration[i];
 global.a2d_cued_delay[i]   = cache_a2d_cued_delay[i];
 global.a2d_cued_sound[i]   = cache_a2d_cued_sound[i];
}
global.a2d_emissions=cache_a2d_emissions;
if ( global.using_audio_grid ) listener_reposition(0,0,0);
