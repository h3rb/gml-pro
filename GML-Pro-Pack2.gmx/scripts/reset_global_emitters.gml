for ( i=0; i<global.max_global_emitters; i++ ) {
 if ( emitter_exists(global.global_emitter[i]) ) {
  audio_emitter_free(global.global_emitter[i]);
 }
 global.global_emitter[i]=noone;
 global.global_sound[i]=noone;
 global.global_sound_priority[i]=0;
 global.global_emitter_gain[i]=1.0;
 global.global_emitter_pitch[i]=1.0;
 global.global_emitter_modulate[i]=0.0;
 global.global_emitter_near[i]=32;
 global.global_emitter_far[i]=256;
 global.global_emitter_factor[i]=1.0;
 global.global_emitter[i]=persist_global_emitter(
  global.global_emitter[i],
  global.global_emitter_gain[i],
  global.global_emitter_pitch[i],
  global.global_emitter_modulate[i],
  global.global_emitter_near[i],
  global.global_emitter_far[i],
  global.global_emitter_factor[i]
 );
}
