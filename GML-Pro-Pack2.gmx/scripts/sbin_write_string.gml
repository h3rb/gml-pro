var i,len,s;
len=string_length(argument1);
s=sbin_write_uint(argument0,len)
for ( i=0; i<len; i++ ) {
 s=sbin_write_byte(argument0,
  ord(string_char_at(argument1, i)) - ord("0")
 );
}
return s;
