var sg,val;
sg = file_bin_read_byte(argument0);
if sg == 0 sg = -1;
val = bin_read_uint(argument0);
return val * sg;

// source lunedi, Les Noctambules GML blog
