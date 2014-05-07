// Attempt to connect to a remote client and establish outgoing buffer.
// On success, append to client list.
// Args: ip string, tcp port, udp port, use tcp(true)/udp(false)
// Return: If it fails, returns -1, otherwise returns client_id
var i;
i=global.remotes;

// TCP Client Connecting to a Remote Server

global.remote_ip[i] = argument0;
if ( argument_count < 2 ) {
 global.remote_port_tcp[i] = 6510;
 global.remote_port_udp[i] = 6511;
} else {
 global.remote_port_tcp[i] = argument1;
 global.remote_port_udp[i] = argument2;
}

if ( argument_count == 4 ) {
 if ( argument3 == true ) {
  global.client_tcp[i] = network_create_socket( network_socket_tcp );
  network_connect( global.client_tcp[i], global.remote_ip[i], global.remote_port_tcp[i] );
 } else {
  global.client_udp[i] = network_create_socket( network_socket_udp );
  network_connect( global.client_udp[i], global.remote_ip[i], global.remote_port_udp[i] );
 }
} else {
 global.client_tcp[i] = network_create_socket( network_socket_tcp );
 network_connect( global.client_tcp[i], global.remote_ip[i], global.remote_port_tcp[i] );
 global.client_udp[i] = network_create_socket( network_socket_udp );
 network_connect( global.client_udp[i], global.remote_ip[i], global.remote_port_udp[i] );
}

// Network buffering

global.network_outgoing[i] = buffer_create( 256, buffer_grow, 1 );

global.remotes+=1;
return i;
