var line;

var linecount;

linecount=string_split(global.master_list_raw,"#");

var i;

global.servers_in_list=0;

for ( i=0; i<linecount; i++ ) {
 var words;
 words=string_split2(global.script_string_split[i],"|");
 if ( words >= 5 ) {
  var j;
  j=global.servers_in_list;
  global.server_listed_ip[j]=global.script_string_split[0];
  global.server_listed_port_tcp[j]=real(global.script_string_split[1]);
  global.server_listed_port_udp[j]=real(global.script_string_split[2]);
  global.server_listed_x[j]=real(global.script_string_split[3]);
  global.server_listed_y[j]=real(global.script_string_split[4]);
  global.servers_in_list++;
 }
}
