for ( i=0; i<global.max_global_emitters; i++ ) {
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
