// Removes a2d from 'long term storage' mode (how a2d_get and a2d_set) work.
// Stores the results in global.a2d[x+y*w,1..r] for faster lookup, with global.a2d[x+y*w,0] as the length
var i,j,k,r,s,t,a,longest,deepest,d3,d2,d1;
a=argument0;
if ( argument_count == 1 ) {
 d3=global.d3;
 d2=global.d2;
 d1=global.d;
} else if ( argument_count == 2 ) {
 d3=global.d3;
 d2=global.d2;
 d1=argument1;
} else if ( argument_count == 4 ) {
 d3=argument3;
 d2=argument2;
 d1=argument1;
} else show_message("a2d_decompile: Wrong number of arguments, accepts 1,2,4");
t=string_split(a,d3);
global.a2d_w=t;
global.a2d_size=0;
global.a2d[0,0]=0;
longest=0;
for ( i=0; i<t; i++ ) {
 s=string_split2(global.script_string_split[i],d2);
 if ( s > longest ) longest=s;
 for ( j=0; j<s; j++ ) {
  r=string_split3(global.script_string_split2[j],d1);
  global.a2d[i+j*t,k+1]=r;
  for ( k=0; k<r; k++ ) global.a2d[i+j*t,k+1]=global.script_string_split3[k];
 }
}
// Normalize (fill in empty ones...)
for ( i=0; i<t; i++ ) {
 s=string_split2(global.script_string_split[i],d2);
 if ( s < longest ) {
  for ( j=s; j<longest; j++ ) global.a2d[i+j*t,0]=0;
 }
}
global.a2d_h=longest;
global.a2d_size=global.a2d_w*global.a2d_h;
