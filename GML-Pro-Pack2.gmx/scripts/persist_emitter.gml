var in_emitter=argument0;
var _gain=argument1;
var _pitch=argument2;
var _modulate=argument3;
var _near=argument4;
var _far=argument5;
var _factor=argument6;
var out_emitter=in_emitter;
if ( not emitter_exists(out_emitter) ) {
 out_emitter=emits(_gain,_pitch,_modulate,_near,_far,_factor, 0,0,0, 0,0,0);
}
global.persisted_emitter=out_emitter;
return out_emitter;
