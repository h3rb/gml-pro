var in,count,len,newlen;
in=argument0;

count=split_lines(in);
len=0;
for ( i=0; i<count; i++ ) {
 newlen=string_length(global.script_split_lines[i]);
 if ( newlen > len ) len=newlen;
}

return len;
