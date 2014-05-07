var str,len,i,v;
str = "";
len = bin_read_uint(argument0);
for (i = 1; i <= len; i += 1) {
 v = file_bin_read_byte(argument0);
 str += chr(v + ord("0"));
}
return str;
