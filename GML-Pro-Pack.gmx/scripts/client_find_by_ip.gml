// Find active client_id by ip string
// Returns: -1 if none, or client_id
var s;
s=argument0;
var i;
for ( i=0; i<global.remotes; i++ ) {
 if ( s == global.remote_ip ) return i;
}
return -1;
