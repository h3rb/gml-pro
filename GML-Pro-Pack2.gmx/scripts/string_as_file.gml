var output,filename,fp;
output=argument0;
filename=argument1;
fp=file_text_open_write(filename);
file_text_write_string(fp,output);
file_text_close(fp);
/*
fp = file_bin_open(filename,1);
file_bin_rewrite(fp);
len=string_length(output);
byte=0;
for ( i=0; i<len; i++ ) {
 byte=ord(string_char_at(output,i+1));
 file_bin_write_byte(fp,byte&$FF);
}
file_bin_close(fp);
*/
return 1;
