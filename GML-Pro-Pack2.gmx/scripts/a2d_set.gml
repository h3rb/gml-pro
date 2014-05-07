var a,ecks,why,value,i,j,t,s,o;
a=argument0;
ecks=argument1;
why=argument2;
value=argument3;
t=string_split(a,global.d3);
o="";
for ( i=0; i<ecks; i++ ) {
 o+=global.script_string_split[i]+global.d3;
}
s=string_split2(global.script_string_split[why],global.d2);
for ( j=0; j<why; j++ ) {
 o+=global.script_string_split2[j]+global.d2;
}
o+=value+global.d2;
if ( why+1 < s ) for ( j=why+1; j<s; j++ ) {
 o+=global.script_string_split[j]+global.d2;
}
if ( ecks+1 < t )  for ( i=ecks+1; i<t; i++ ) {
 o+=global.script_string_split[i]+global.d3;
}
return o;
