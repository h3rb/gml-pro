var i;
var s;
i=argument1;
if ( i < 0 ) {
 i = i * -1;
 s=sbin_write_byte(argument0, 0);
} else s=sbin_write_byte(argument0, 1);
return sbin_write_uint(s,i);
