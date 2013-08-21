var i,s_active,e_active,count;
count=0;
e_active[0]=0;
s_active[0]=0;
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
