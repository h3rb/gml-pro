// Converts a region of global.script_array2, returning the equivalent stringarray
var w,h,i,j,out;
w=argument0;
h=argument1;
out=sa_new(w,h);
for ( i=0; i<w; i++ ) {
 for ( j=0; j<h; j++ ) {
  out=sa_put(out,i,j,global.script_array2[i,j]);
 }
}
return out;
