var v;
v=string_copy(argument0,1,1);
global.bytes[0]=ord(v);
return string_copy(argument0,2,string_length(v)-1);
