var i,len;
len=string_length(argument1);
bin_write_uint(argument0,len)
for (i = 1; i <= len; i += 1) {
 file_bin_write_byte(argument0,
  ord(string_char_at(argument1, i)) - ord("0"));
}
