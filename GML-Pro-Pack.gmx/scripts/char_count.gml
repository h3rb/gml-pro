var instr,ch,len,count,j;
instr=argument0;
ch = chr(argument1);
len=string_length(instr);
count=0;
for ( j=0; j<len; j++ ) if ( string_char_at(instr,j) == ch ) count++;

return count;
