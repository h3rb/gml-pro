/// persist_relative_looping_emitter(object,emitter,soundid,sfx,gain,pitch,modulation,near,far,factor,priority);
var o=argument0;
var in_emitter=argument1;
var in_soundid=argument2;
var _sfx=argument3;
var _gain=argument4;
var _pitch=argument5;
var _modulate=argument6;
var _near=argument7;
var _far=argument8;
var _factor=argument9;
var _priority=argument10;
var out_emitter=in_emitter;
global.persisted_sound=in_soundid;
if ( not emitter_exists(out_emitter) ) {
 out_emitter=emits(_gain,_pitch,_modulate,_near,_far,_factor, 0,0,0, 0,0,0);
 global.persisted_sound=audio_play_sound_on(out_emitter,_sfx,true,_priority ); // infinite loop
} else if ( not sound_playing(in_soundid) ) {
 global.persisted_sound=audio_play_sound_on(out_emitter,_sfx,true,_priority ); // infinite loop
}
audio_emitter_position(out_emitter,o.x,o.y,0); 
global.persisted_emitter=out_emitter;
return out_emitter;
