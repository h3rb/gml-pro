// called in networking event

var message_type;
message_type 
 = ds_map_find_value(async_load, "type");
 
if ( message_type == network_type_connect ) {//
 var socket_id = ds_map_find_value( async_load, "socket" ); // is this correct?
 var client_id = client_find_by_socket_id(socket_id);
 client_store_ip(client_id);
 client_remove(client_id);
} else if ( message_type == network_type_data ) {//
 var socket_id = ds_map_find_value( async_load, "id" );
 var client_id = client_find_by_socket_id(socket_id);
 var incoming_size = ds_map_find_value( async_load, "size" );
 var incoming_buffer = ds_map_find_value( async_load, "buffer" ); 
 var isUDP;
 if ( socket_id == global.client_tcp[client_id] ) isUDP=false;
 else isUDP=true;
 if ( s > 0 ) { // if we received something
  if ( isUDP ) { // UDP Message Codes
   if ( global.client_udp_waiting_for[client_id] == 0 ) { // Hello World UDP
    global.client_udp_waiting_for[client_id] = buffer_read(incoming_buffer,buffer_u8);
   } else { // expecting..
    if ( global.client_waiting_for        == 1 ) { // string
     client_add_message( client_id, global.client_udp_waiting_for[id], buffer_read(incoming_buffer,buffer_string) );
    } else if ( global.client_waiting_for == 2 ) { // signed int32 (translates to real)
     client_add_message( client_id, global.client_udp_waiting_for[id], buffer_read(incoming_buffer,buffer_s32) );
    } else if ( global.client_waiting_for == 3 ) { // signed float32 (translates to real)
     client_add_message( client_id, global.client_udp_waiting_for[id], buffer_read(incoming_buffer,buffer_f32) );
    } else if ( global.client_waiting_for == 4 ) { // keycode transaction
     client_add_message( client_id, global.client_udp_waiting_for[id], incoming_buffer );
    } else if ( global.client_waiting_for == 5 ) { // true/false
     client_add_message( client_id, global.client_udp_waiting_for[id], buffer_read(incoming_buffer,buffer_bool) );
    } else if ( global.client_waiting_for == 6 ) {
     client_add_message( client_id, global.client_udp_waiting_for[id], incoming_buffer );
    } else {} // we're ignoring data we don't understand, aka a packet was lost
    global.client_udp_waiting_for[client_id]=0; // go back to waiting for msg type byte-code...
   }
  } else { // TCP Message Codes
   if ( global.client_tcp_waiting_for[client_id] == 0 ) { // Hello World TCP
    global.client_udp_waiting_for[client_id] = buffer_read(incoming_buffer,buffer_u8);
   } else { // expecting..
    if ( global.client_waiting_for        == 1 ) { // string
     client_add_message( client_id, global.client_tcp_waiting_for[id], buffer_read(incoming_buffer,buffer_string) );
    } else if ( global.client_waiting_for == 2 ) { // int32 (translates to real)
     client_add_message( client_id, global.client_tcp_waiting_for[id], buffer_read(incoming_buffer,buffer_s32) );
    } else if ( global.client_waiting_for == 3 ) { // float32 (translates to real)
     client_add_message( client_id, global.client_tcp_waiting_for[id], buffer_read(incoming_buffer,buffer_f32) );
    } else if ( global.client_waiting_for == 4 ) { // keycode transaction
     client_add_message( client_id, global.client_tcp_waiting_for[id], incoming_buffer );
    } else if ( global.client_waiting_for == 5 ) { // true/false
     client_add_message( client_id, global.client_tcp_waiting_for[id], buffer_read(incoming_buffer,buffer_bool) );
    } else if ( global.client_waiting_for == 6 ) {
     client_add_message( client_id, global.client_udp_waiting_for[id], incoming_buffer );
    } else {} // we're ignoring data we don't understand
    global.client_tcp_waiting_for[client_id]=0; // go back to waiting for msg type byte-code...
   }
  } 
 }
} else if ( message_type == network_type_disconnect ) {//
 var socket_id = ds_map_find_value( async_load, "socket" );
 var client_id = client_find_by_socket_id(socket_id);
 client_store_ip(client_id);
 client_remove(client_id);
}//
