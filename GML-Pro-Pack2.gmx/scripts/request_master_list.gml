// to snarf the master list, assemble a URL to interact with IO.php
// called often
global.url
 =global.server_list_base_url
 +"?announce="+int(global.local_port_tcp)
 +"&port="+int(global.local_port_udp)
 +"&x="+int(global.broadcast_x)
 +"&y="+int(global.broadcast_y)
;

global.master_list_http_got=http_get(global.url);
