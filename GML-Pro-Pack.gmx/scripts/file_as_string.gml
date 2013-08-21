var filename,buffer,fp;
filename=argument0;
buffer="";
if ( !file_exists(filename) ) return buffer;
fp = file_bin_open(filename, 0);
while( file_bin_position(fp) != file_bin_size(fp) )
 buffer += chr(file_bin_read_byte(fp));
file_bin_close(fp);
return buffer;
