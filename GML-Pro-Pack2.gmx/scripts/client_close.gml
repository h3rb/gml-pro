// Close a client's network connections and destroy the buffer.
// Args: client_id, destroy (default=true)
var i;
i=argument[0];

var destroy;
if ( argument_count < 2 ) destroy=true;
else destroy=argument[1];

buffer_delete(global.network_outgoing[i]);
network_destroy(global.client_tcp[i]);
network_destroy(global.client_udp[i]);
