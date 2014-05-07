var count=0;
var e_active;
var s_active;
var i;
for ( i=0; i<global.emitters; i++ ) {
 if ( !sound_isplaying(global.emitted[i]) ) {
  audio_emitter_free(global.emitter[i]);
 } else {
  e_active[count]=global.emitted[i];
  s_active[count]=global.emitter[i];
  count++;
 }
}
for ( i=0; i<count; i++ ) {
 global.emitted[i]=e_active[i];
 global.emitter[i]=s_active[i];
}
global.emitters=count;
