// Removes client_id from client list
// Args: client_id, close: true/[false], destroy [true if close]/false

var i;
i=argument[0];

var close_it;
if ( argument_count < 2 ) close_it=false;
else close_it=argument[1];
if ( close_it ) {
 if ( argument_count < 3 ) client_close(i,true); // destroy buffer?
 else client_close(i,argument[2]);
}

var // temporary variables to store values while removing
 tremotes,
 tremote_ip,
 tremote_port_tcp,
 tremote_port_udp,
 tclient_name,
 tclient_tcp,
 tclient_udp,
 tclient_tcp_waiting_for,
 tclient_udp_waiting_for,
 tnetwork_outgoing,
 tclient_messages,
 tclient_message_real,
 tclient_message_string,
 tclient_message_key,
 tclient_message_bool,
 tclient_message_type;

tremotes = 0;
tremote_ip[0]="";
tremote_port_tcp[0]=0;
tremote_port_udp[0]=0;
tclient_name[0]="";
tclient_tcp[0]=-1;
tclient_udp[0]=-1;
tclient_tcp_waiting_for[0]=0;
tclient_udp_waiting_for[0]=0;
tnetwork_outgoing[0]=0;
tclient_messages[0]=0;
tclient_message_real[0]=0;
tclient_message_string[0]="";
tclient_message_key[0]=0;
tclient_message_bool[0]=0;
tclient_message_type[0]=0;

var j,p;
for ( j=0; j<i; j++ ) {
 tremote_ip[j]=global.remote_ip[j];
 tremote_port_tcp[j]=global.remote_port_tcp[j];
 tremote_port_udp[j]=global.remote_port_udp[j];
 tclient_name[j]=global.client_name[j];
 tclient_tcp[j]=global.client_tcp[j];
 tclient_udp[j]=global.client_udp[j]; 
 tclient_tcp_waiting_for[j]=global.client_tcp_waiting_for[j];
 tclient_udp_waiting_for[j]=global.client_udp_waiting_for[j];
 tnetwork_outgoing[j]=global.network_outgoing[j];
 tclient_messages[j]=global.client_messages[j];
 for ( p=0; p<tclient_messages[j]; p++ ) {
  tclient_message_type[j,p]=global.client_message_type[j,p];
  tclient_message_real[j,p]=global.message_real[j,p];
  tclient_message_string[j,p]=global.message_string[j,p];
  tclient_message_key[j,p]=global.client_message_key[j,p];
  tclient_message_bool[j,p]=global.client_message_bool[j,p];
 }
 tremotes+=1;
}

var k;
for ( k=(i+1); k<global.remotes; k++ ) {
 j=k-1;
 tremote_ip[j]=global.remote_ip[k];
 tremote_port_tcp[j]=global.remote_port_tcp[k];
 tremote_port_udp[j]=global.remote_port_udp[k];
 tclient_name[j]=global.client_name[k];
 tclient_tcp[j]=global.client_tcp[k];
 tclient_udp[j]=global.client_udp[k];
 tclient_tcp_waiting_for[j]=global.client_tcp_waiting_for[k];
 tclient_udp_waiting_for[j]=global.client_udp_waiting_for[k];
 tnetwork_outgoing[j]=global.network_outgoing[k];
 tclient_messages[j]=global.client_messages[k];
 for ( p=0; p<tclient_messages[j]; p++ ) {
  tclient_message_type[j,p]=global.client_message_type[k,p];
  tclient_message_real[j,p]=global.message_real[k,p];
  tclient_message_string[j,p]=global.message_string[k,p];
  tclient_message_key[j,p]=global.client_message_key[k,p];
  tclient_message_bool[j,p]=global.client_message_bool[k,p];
 }
 tremotes+=1;
}

// Copy our cache back into the main global.
for ( j=0; j<tremotes; j++ ) {
 global.remote_ip[j]=tremote_ip[j];
 global.remote_port_tcp[j]=tremote_port_tcp[j];
 global.remote_port_udp[j]=tremote_port_udp[j];
 global.client_name[j]=tclient_name[j];
 global.client_tcp[j]=tclient_tcp[j];
 global.client_udp[j]=tclient_udp[j];
 global.client_tcp_waiting_for[j]=tclient_tcp_waiting_for[j];
 global.client_udp_waiting_for[j]=tclient_udp_waiting_for[j];
 global.network_outgoing[j]=tnetwork_outgoing[j];
 global.client_messages[j]=tclient_messages[j];
 for ( p=0; p<tclient_messages[j]; p++ ) {
  global.client_message_type[j,p]=tclient_message_type[j,p];
  global.client_message_real[j,p]=tclient_message_real[j,p];
  global.client_message_string[j,p]=tclient_messaage_string[j,p];
  global.client_message_key[j,p]=tclient_message_key[j,p];
  global.client_message_bool[j,p]=tclient_message_bool[j,p];
 }
}
global.remotes=tremotes;
