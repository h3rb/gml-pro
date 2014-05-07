for ( i=0; i<global.emitters; i++ ) {
 if ( audio_emitter_exists(global.emitter[i]) )
  audio_emitter_free(global.emitter[i]);
}
global.emitters=0;
