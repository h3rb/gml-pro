var b1,b2,b3,b4,val;
b1 = file_bin_read_byte(argument0);
b2 = file_bin_read_byte(argument0);
b3 = file_bin_read_byte(argument0);
b4 = file_bin_read_byte(argument0);
val = (b1 << 24) + (b2 << 16)+ (b3 << 8) + b4;
return val;
