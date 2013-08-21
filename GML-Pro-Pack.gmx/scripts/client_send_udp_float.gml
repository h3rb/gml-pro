var i,v;

i=argument0; // client_id
v=argument1; // float32 to send

buffer_seek(global.network_outgoing[i], buffer_seek_start, 0);
buffer_write(global.network_outgoing[i], buffer_f32, v);
return network_send_broadcast(
 global.client_udp[i], global.remote_port_udp[i],
 global.network_outgoing[i], buffer_tell(global.network_outgoing[i])
);
