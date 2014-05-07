/// emits(gain,pitch,modulate_pitch,near,far,factor1.0,x,y,z,dx,dy,dz);
var _gain=argument0; // usually 1.0
var _pitch=argument1;
var _modulate_pitch=argument2;
var _near=argument3;
var _far=argument4;
var _factor=argument5; // usually 1.0
var _ecks=argument6;
var _why=argument7;
var _zed=argument8;
var _dx=argument9;
var _dy=argument10;
var _dz=argument11;
if ( _modulate_pitch > 0 ) _pitch=fuzzy(_pitch,_modulate_pitch);
var e=audio_emitter_create();
audio_emitter_falloff(e,_near,_far,_factor);
audio_emitter_gain(e,_gain);
audio_emitter_pitch(e,_pitch);
audio_emitter_position(e,_ecks,_why,_zed);
audio_emitter_velocity(e,_dx,_dy,_dz);
return e;
