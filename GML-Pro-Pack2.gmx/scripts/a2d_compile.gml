// Places a2d into 'long term storage' mode (how a2d_get and a2d_set) work.
// Gets the results in global.a2d[x+y*w,i] for "cold" storing
// Works with a2d functions
var i,j,k,d3,d2,d1;
if ( argument_count == 0 ) {
 d3=global.d3;
 d2=global.d2;
 d1=global.d;
} else if ( argument_count == 1 ) {
 d3=global.d3;
 d2=global.d2;
 d1=argument1;
} else if ( argument_count == 3 ) {
 d3=argument3;
 d2=argument2;
 d1=argument1;
} else show_message("a2d_compile: Wrong number of arguments, accepts 0,1,3");

var out;
out="";
for ( i=0; i<global.a2d_w; i++ ) {
 var line;
 line="";
 for ( j=0; j<global.a2d_h; j++ ) {
  var v,d,ele;
  v=i+j*global.a2d_w;
  d=global.a2d[v,0];
  ele="";
  for ( k=0; k<d; k++ ) {
   ele=global.a2d[v,k+1]+d1;
  }
  line+=ele+d2;
 }
 out+=line+d3;
}
return out;
