var i=global.radio_queue;
global.radio_sound[i]=argument0;
global.radio_caption[i]=argument1;
global.radio_string[i]=argument2;
global.radio_color[i]=argument3;
global.radio_bgcolor[i]=argument4;
global.radio_icon[i]=argument5;
global.radio_tint[i]=argument6;
global.radio_sub[i]=argument7;
global.radio_dsub[i]=argument8;
global.radio_duration[i]=argument9;
duplicate=false;
if ( i > 0 ) {
 if ( global.radio_bgcolor[i-1] == global.radio_bgcolor[i] 
  and global.radio_sound[i-1] == global.radio_sound[i] )
  duplicate=true;
}
if ( not duplicate ) global.radio_queue+=1;
if ( i == 0 ) {
 // Play sound, set delay
 global.radio_instant=global.radio_duration[0];
 global.radio_last_played_id=
 audio_play_sound(global.radio_sound[0],100,0);  
// show_message("playing radio sound: "
//  +sound_get_name(global.radio_last_played_id) );
}
//show_message("Pushing radio message: "+global.radio_string[i]);
