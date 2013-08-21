var s,neg;
s = sbin_read_byte(argument0);
if ( global.bytes[0] == 0 ) neg = -1;
else neg=1;
s = sbin_read_uint(s);
global.ints[0]=global.ints[0] * neg;
return s;
