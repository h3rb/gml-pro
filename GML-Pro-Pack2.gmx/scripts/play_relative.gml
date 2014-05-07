var sfx=argument0;
var ecks=argument1;
var why=argument2;
var loops=argument3;
var priority=argument4;
var w=window_get_width();
var h=window_get_height();
if ( ecks >= 0 ) {
 if ( why >= 0 ) {
  if ( ecks < w ) {
   if ( why < h ) {
    var e=
      real(int((ecks/room_width)*global.audio_grid_w))
     +real(int((why/room_width)*global.audio_grid_h))
     *global.audio_grid_w
    ;
    audio_play_sound_on(
     global.audio_grid[e],
     sfx, loops, priority
    );
   }
  }
 }
}
