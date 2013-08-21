// Initialize globals
global.emitters=0;
global.emitter[0]=0;
global.emitted[0]=0;

// Cued Loops
global.cued_loops=0;
global.cued_loop[0]=0;
global.cued_loop_count[0]=0;
global.cued_loop_delay[0]=0;
global.cued_loop_instance[0]=0;

// Setup the linear distance model

audio_falloff_set_model(audio_falloff_linear_distance_clamped);
global.falloff_ref_dist=(global.cx + global.cy) /2.0;
global.falloff_max_dist=(global.width + global.height) /2.0;
global.falloff_factor=1.0;
global.priority_high=100;
global.priority_med=50;
global.priority_low=10;

// This means:  d = clamp(listener,reference,maximum) where
// gain = 1.0 - (distance - reference_distance) / (maximum - reference);
//
//

// Setup the distinct panning emitter and other global audio emitters.
global.panning_emitter=audio_emitter_create();
audio_emitter_position(global.panning_emitter,0,0,0);
audio_emitter_falloff(global.panning_emitter,50,100,1);
