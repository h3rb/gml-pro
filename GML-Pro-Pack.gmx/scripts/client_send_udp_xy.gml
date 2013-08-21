var i,ecks,why;

buffer_seek(global.network_outgoing[i], buffer_seek_start, 0);
buffer_write(global.network_outgoing[i], buffer_f32, ecks);
buffer_write(global.network_outgoing[i], buffer_f32, why);
return network_send_broadcast(
 global.client_udp[i], global.remote_port_udp[i],
 global.network_outgoing[i], buffer_tell(global.network_outgoing[i])
);
