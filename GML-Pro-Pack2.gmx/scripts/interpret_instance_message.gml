var r,o,i,n,t,d;
r=argument0; // room
o=argument1; // obj
i=argument2; // instance
n=argument3; // a number
t=argument4; // a message type code
d=argument5; // a data string

if ( o == o_ai_ufse_starbase ) {
 if ( n == 1 ) {
  with (i) event_user(2);
//  i.command_open_door=true;
 } else if ( n == 2 ) {
  audio_play_sound(sfx_Cleared_To_Dock,100,0);
 } else if ( n == 3 ) {
//  show_message("poop2");
  global.player.docking_percent=0.0;
  global.player.docking_instant=0.0;
  global.player.docking_from_x=global.player.x;
  global.player.docking_from_y=global.player.y;
  global.player.docking_to_x=i.x;
  global.player.docking_to_y=i.y;
  global.player.docking_at=i;
  global.player.docking_at_obj=i.object_index;
  global.player.docking_to=rm_map_starbase;
  global.player.docking=true;
  global.player_velocity=0.0;
 } else if ( n == 4 ) {
  // Update cargo from scratch...
 }
}
