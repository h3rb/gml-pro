var i,v;

i=argument0; // client_id
v=argument1; // bool to send

buffer_seek(global.network_outgoing[i], buffer_seek_start, 0);
buffer_write(global.network_outgoing[i], buffer_bool, v);
return network_send_packet( global.client_tcp[i], global.network_outgoing[i], buffer_tell(global.network_outgoing[i]) );
