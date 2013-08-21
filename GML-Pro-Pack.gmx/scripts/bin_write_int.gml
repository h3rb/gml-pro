var i;
i=argument1;
if ( i < 0 ) {
 i = i * -1;
 file_bin_write_byte(argument0, 0);
} else file_bin_write_byte(argument0, 1);
bin_write_uint(argument0, i);
