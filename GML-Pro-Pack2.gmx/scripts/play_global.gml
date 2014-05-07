var _sfx=argument0;
var _loops=argument1;
var _gain=argument2;
var _pitch=argument3;
var _far=argument4;
var _priority=argument5; 
var was=global.next_global_emitter;
var i=global.next_global_emitter;
var stop=false;
while ( not stop ) {
 if ( i < global.max_global_emitters ) {
  if ( global.global_sound_priority[i] > _priority ) {
   i++;
  } else stop=true;
 } else stop=true;
}
if ( i == global.max_global_emitters ) {
 i=was;
}
global.next_global_emitter=(i+1)%global.max_global_emitters;
global.global_emitter_far[i]=_far;
persist_global_emitter(
 global.global_emitter[i],
 global.global_emitter_gain[i],
 global.global_emitter_pitch[i],
 global.global_emitter_modulate[i],
 global.global_emitter_near[i],
 global.global_emitter_far[i],
 global.global_emitter_factor[i]
);
global.global_sound[i]=
 audio_play_sound_on(global.global_emitter[i],_sfx,_loops,_priority);
audio_emitter_gain(global.global_emitter[i],_gain);
audio_emitter_pitch(global.global_emitter[i],_pitch);
global.global_sound_priority[i]=_priority;
return i;
