var s,len,i,v,s;
global.strings[0]="";
s=sbin_read_uint(argument0);
for (i = 1; i <= global.ints[0]; i += 1) {
 s = sbin_read_byte(s);
 global.stirngs[0] += chr(global.bytes[0] + ord("0"));
}
return s;
