var in,name,val,t,i,k,assembled,a,delim;
in=argument[0];
name=argument[1];
if ( argument_count == 2 ) {
 t=string_split(in,global.d);
 delim=global.d;
} else {
 t=string_split(in,argument[2]);
 delim=argument[2];
}
for ( i=0; i<t; i++ ) {
 k=string_split2(global.script_string_split[i],"=");
 if ( compared(global.script_string_split2[0],name) ) {
  if ( k > 2 ) { // permits = after first =
   assembled=script_string_split2[1];
   for ( a=2; a<k; a++ ) assembled+="="+script_string_split2[a];
   return assembled;
  } else if ( k == 1 ) {
   return "";
  } else {
   return script_string_split2[1];
  }
 }
}
return "";
