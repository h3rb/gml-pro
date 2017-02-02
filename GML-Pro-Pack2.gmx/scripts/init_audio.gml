var i;
global.listener_x=0;
global.listener_y=0;
global.listener_z=0;
global.max_global_emitters=10;
for ( i=0; i<global.max_global_emitters; i++ ) {
 global.global_emitter[i]=noone;
 global.global_sound[i]=noone;
 global.global_sound_priority[i]=0;
 global.global_emitter_gain[i]=1.0;
 global.global_emitter_pitch[i]=1.0;
 global.global_emitter_modulate[i]=0.0;
 global.global_emitter_near[i]=32;
 global.global_emitter_far[i]=256;
 global.global_emitter_factor[i]=1.0;
}
global.next_global_emitter=0;
// Used by persist_emitter() function
global.persisted_sound=noone;
global.persisted_emitter=noone;
// Initialize globals for Emitter Manager
global.emitters=0;
global.emitter[0]=0;
global.emitted[0]=0;
global.emitting[0]=0;
// Cued Loops, which are sounds that will be played later
global.cued_loops=0;
global.cued_loop[0]=0;
global.cued_loop_count[0]=0;
global.cued_loop_delay[0]=0;
global.cued_loop_instance[0]=0;
// Initialize Audio 2D Emitter Manager
// Audio 2D uses emits() function to generate an emitter,
// and this can be combined with play() function to play sound,
// or this can be combined with plays_delayed() function to 
// delay, for some given interval, a sound from being emitted.
global.a2d_emissions=0;
global.a2d_emitted=-1;
global.a2d_emitter[0]=0;
global.a2d_expired[0]=0;
global.a2d_cued_sound[0]=0;
global.a2d_cued_priority[0]=0;
global.a2d_cued_loops[0]=0;
global.a2d_cued_delay[0]=0;
global.a2d_cued_duration[0]=0;
global.a2d_sound_index[0]=noone;
global.a2d_emitter_limit=50; // when recycling starts.
// Emitter FX delta T, Modifies Emitter Data Over Time For FX
// Can be hooked to any existing emitter, auto-destroyed
// when it encounters an emitter that is already destroyed.
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
// Audio Grid
// Audio Grid has to be used instead of Area Sound 2D, not with
global.using_audio_grid=false;
global.audio_grid[0]=0;
global.audio_grid_w=40;
global.audio_grid_h=30;
var gw2=global.audio_grid_w/2;
var gh2=global.audio_grid_h/2;
var i,j;
var win_w=window_get_width();
var win_h=window_get_height();
var gcw=win_w/global.audio_grid_w;
var gch=win_h/global.audio_grid_h;
var audio_near=64.0;
var audio_far=win_w/2+win_w/6;
for ( i=0; i<global.audio_grid_w; i++ ) {
 for ( j=0; j<global.audio_grid_h; j++ ) {
  var v=i+j*global.audio_grid_w;
  var e=audio_emitter_create();
  global.audio_grid[v]=e;
  audio_emitter_falloff(e,audio_near,audio_far,1.0);
  audio_emitter_position(e,(i-gw2)*gcw,(j-gh2)*gch,0);
  audio_emitter_pitch(e,1.0+random(0.2)-0.1);
 }
}
// Radio
// Radio is a persistent, queued sound system
// with associated text and sprite/sub/anim
global.radio_female=0;
global.radio_male=1;
global.radio_robot=2;
global.radio_alien=3;
global.radio_queue=0;
global.radio_sound[0]=sfx_empty;
global.radio_caption[0]="This is who said it.";
global.radio_string[0]="This is what is said.";
global.radio_color[0]=c_lime;
global.radio_bgcolor[0]=c_green;
global.radio_icon[0]=s_empty;
global.radio_tint[0]=c_white;
global.radio_sub[0]=0;
global.radio_dsub[0]=0;
global.radio_duration[0]=0.0;
global.radio_instant=0.0;
global.radio_fade=0.1;
global.radio_last_played_id=noone;
global.radio_captionbg=make_color_rgb(32,32,32);
global.radio_captionborder=make_color_rgb(127,127,127);
global.voice_effect=sfx_empty;
global.voice_string="This is what is said.";
global.voice_duration=0.0;
// Singletons: Sounds played only once at at time.  See play_singleton
global.singletone_sounds=0;
global.singletone_sound[0]=noone;
global.singletone_duration[0]=0;
