/// play(sound,priority,loops,duration,emitter);
var sound=argument0;
var priority=argument1;
var loops=argument2; // true or false, not # of loops
var duration=argument3; // -1 = infinite (emitter will persist)
var emitter=argument4;
var i=global.a2d_emissions;
if ( i > global.a2d_emitter_limit ) { // recycle oldest
 var j;
 var expired=10000;
 var candidate=0;
 for ( j=0; j<i; j++ ) {
  if ( expired > global.a2d_expired[j] ) {
   candidate=j;
   expired=global.a2d_expired[j];
  }
 }
 i=candidate; 
} else { // add new
 global.a2d_emissions++;
}
global.a2d_emitter[i]=emitter;
global.a2d_expired[i]=0.0;
global.a2d_cued_sound[i]=sound;
global.a2d_cued_priority[i]=priority;
global.a2d_cued_loops[i]=loops;
global.a2d_cued_delay[i]=0;
global.a2d_cued_duration[i]=duration;
global.a2d_sound_index[i]=audio_play_sound_on(emitter,sound,loops,priority);
return global.a2d_sound_index[i];
global.a2d_emitted=i;
