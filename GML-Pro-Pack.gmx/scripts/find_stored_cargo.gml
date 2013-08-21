var i;
i=argument0;
var j;
for ( j=0; j<global.cargo_stored_count; j++ )
 if ( global.cargo_storage_uid[j] == i ) return global.cargo_storage[j];
return "";
