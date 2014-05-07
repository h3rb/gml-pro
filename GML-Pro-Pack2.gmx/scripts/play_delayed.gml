var sound=argument0;
var priority=argument1;
var loops=argument2;
var duration=argument4; // -1 = infinite
var delay=argument3;
var emitter=argument5;
var i=global.a2d_emissions;
global.a2d_emissions++;
global.a2d_emitter[i]=emitter;
global.a2d_expired[i]=0.0;
global.a2d_cued_sound[i]=sound;
global.a2d_cued_priority[i]=priority;
global.a2d_cued_loops[i]=loops;
global.a2d_cued_delay[i]=delay;
global.a2d_cued_duration[i]=duration;
return i;
