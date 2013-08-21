var in,name,value,t,i,out,k,delim,found;
in=argument0;
name=argument1;
value=argument2;
if ( argument_count == 3 ) {
 t=string_split(in,global.d);
 delim=global.d;
} else {
 t=string_split(in,argument3);
 delim=argument3;
}
out="";
found=false;
for ( i=0; i<t; i++ ) {
 k=string_split2(global.script_string_split[i],"=");
 if ( compared(global.script_string_split2[0],name) ) {
  out+=name+"="+value+delim;
  found=true;
 } else out+=global.script_string_split[i]+delim;
}
if ( !found ) {
 return out+name+"="+value+delim;
}
return out;
