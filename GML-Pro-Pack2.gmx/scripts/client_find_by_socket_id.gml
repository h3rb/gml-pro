// Args: Socket_id of udp or tcp socket
// Return an active client_id by socket, or -1 if none found
var s;
s=argument0;
var i;
for ( i=0; i<global.remotes; i++ ) {
 if ( s == global.client_udp ) return i;
 if ( s == global.client_tcp ) return i;
}
return -1;
