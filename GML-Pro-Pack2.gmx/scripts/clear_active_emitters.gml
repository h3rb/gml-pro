var i;
for ( i=0; i<global.emitters; i++ ) {
 if ( sound_isplaying(global.emitted[i]) ) sound_stop(global.emitted[i]);
 audio_emitter_free(global.emitter[i]);
}
global.emitters=0;
