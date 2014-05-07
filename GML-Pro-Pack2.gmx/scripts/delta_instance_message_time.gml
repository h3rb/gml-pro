for ( i=0; i<global.instance_messages_pending; i++ ) {
 if ( global.instance_message_room[i] == room ) {
  if ( global.instance_message_delay[i] > 0.0 ) {
   global.instance_message_delay[i] -=1/room_speed;
  }
 }
}
