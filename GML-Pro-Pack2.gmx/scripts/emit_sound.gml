var _sound=argument0;
var _gain=argument1; // usually 1.0
var _pitch=argument2;
var _loop=argument3;
var _priority=argument4;
var _modulate_pitch=argument5;
var _falloff=argument6;
var _near=argument7;
var _far=argument8;
var _factor=argument9; // usually 1.0
var _ecks=argument10;
var _why=argument11;
var _zed=argument12;
var _dx=argument13;
var _dy=argument14;
var _dz=argument15;
if ( _modulate_pitch > 0 ) _pitch=fuzzy(_pitch,_modulate_pitch);
var i=global.emitters;
global.emitters+=1;
var e=audio_emitter_create();
global.emitter[i]=e;
global.emitting[i]=_sound;
audio_emitter_falloff(e,_near,_far,_factor);
audio_emitter_gain(e,_gain);
audio_emitter_pitch(e,_pitch);
audio_emitter_position(e,_ecks,_why,_zed);
audio_emitter_velocity(e,_dx,_dy,_dz);
global.emitted[i]=audio_play_sound_on(e,_sound,_loop,_priority);
return e;
