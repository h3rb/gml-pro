var v1,v2,v3,v4;
v1 = argument1 >> 24;
v2 = argument1 >> 16;
v3 = argument1 >> 8;
v4 = argument1;
file_bin_write_byte(argument0, v1);
file_bin_write_byte(argument0, v2);
file_bin_write_byte(argument0, v3);
file_bin_write_byte(argument0, v4);
