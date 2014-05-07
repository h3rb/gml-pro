var _sfx=argument0;
var _loops=argument1;
var _gain=argument2;
var _pitch=argument3;
var _far=argument4;
var _priority=argument5; 
var i=0;
var found=false;
for ( i=0; i<global.singletone_sounds and not found; i++ ) {
 if ( global.singletone_sound[i] == _sfx ) found=true;
}
if ( found ) return -1;
var idx=global.singletone_sounds;
global.singletone_sound[idx]=_sfx;
global.singletone_duration[idx]=audio_sound_length(_sfx);
global.singletone_sounds++;
return play_global(_sfx,_loops,_gain,_pitch,_far,_priority);
