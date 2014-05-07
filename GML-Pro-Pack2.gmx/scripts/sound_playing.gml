if ( argument0 != noone ) {
 if ( sound_exists(argument0) ) {
  return audio_is_playing(argument0);
 }
}
return false;
