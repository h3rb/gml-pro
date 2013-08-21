var in,ignore_next,len,storing,j;
in=argument0;
// Splits lines by newline character (# without / in front of it)
ignore_next=false;
len=string_length(in);
storing=0;
global.script_split_lines[storing]="";
for ( j=1; j<=len; j++ ) {
 if ( ignore_next ) {
  global.script_split_lines[storing]+=string_char_at(in,j);
  ignore_next=false;
 } else {
  if ( "/" == string_char_at(in,j) ) {
   global.script_split_lines[storing]+=string_char_at(in,j);
   ignore_next=true;
  } else {
   if ( "#" == string_char_at(in,j)
    || chr(13) == string_char_at(in,j)
    || chr(10) == string_char_at(in,j) ) {
    storing++;
    global.script_split_lines[storing]="";
   } else {
    global.script_split_lines[storing]+=string_char_at(in,j);
   }
  }
 }
}
if ( string_length(global.script_split_lines[storing]) > 0 ) storing+=1;
return storing;
