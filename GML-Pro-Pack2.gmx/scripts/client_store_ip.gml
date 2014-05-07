// Store a client IP in the remembered clients list, if not already
// 'remembered'
// Args: client_id
var i;
i=argument0;

var k;
var found;
found=false;
for ( k=0; not found and k<global.ips_remembered; k++ ) {
 if ( compared(global.ip_remembered[k],global.remote_ip[i]) ) {
  global.ip_last_seen[d]=current_time;
  found=true;
 }
}

if ( not found ) {
 var d;
 d=global.ips_remembered;

 global.ip_remembered[d]=global.remote_ip[i];
 global.ip_udp[d]=global.remote_port_udp[i];
 global.ip_tcp[d]=global.remote_port_tcp[i];
 global.ip_last_seen[d]=current_time;
 global.ip_friendly_name[d]=global.client_name[i];
 global.ip_favorite[d]=false;

 global.ips_remembered+=1;
}
