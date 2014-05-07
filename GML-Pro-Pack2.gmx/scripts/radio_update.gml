if ( global.radio_queue > 0 ) {
 if ( global.radio_instant > 0 and global.radio_sound[0] != sfx_empty ) {
  global.radio_instant-=1/room_speed;
 } else {
  global.radio_queue-=1;
  if ( global.radio_queue > 0 ) {
   var i;
   for ( i=0; i<global.radio_queue; i++ ) {
    var j=i+1;
    global.radio_sound[i]=global.radio_sound[j];
    global.radio_caption[i]=global.radio_caption[j];
    global.radio_string[i]=global.radio_string[j];
    global.radio_color[i]=global.radio_color[j];
    global.radio_bgcolor[i]=global.radio_bgcolor[j];
    global.radio_icon[i]=global.radio_icon[j];
    global.radio_tint[i]=global.radio_tint[j];
    global.radio_sub[i]=global.radio_sub[j];
    global.radio_dsub[i]=global.radio_dsub[j];
    global.radio_duration[i]=global.radio_duration[j];
   }
   // Play sound, set delay
   global.radio_instant=global.radio_duration[0];
   global.radio_last_played_id=
    audio_play_sound(global.radio_sound[0],100,0);
//   show_message("playing radio sound: "
//    +sound_get_name(global.radio_last_played_id)   );
  }
 }
}
