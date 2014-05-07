// Delays a loop for a little bit to let another sound play
// audio_delayed_loop(sfxid,loops,seconds) returns cued_id
var i;
i=global.cued_loops;
global.cued_loop[i]=argument0;
global.cued_loop_count[i]=argument1;
global.cued_loop_delay[i]=argument2;
global.cued_loop_instance[i]=noone;
global.cued_loops++;
return i;
