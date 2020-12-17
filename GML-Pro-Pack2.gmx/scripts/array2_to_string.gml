var use_type,out,w,h,sep1,sep2,sep3,i,j,header;
// Convert a bidimensional array to a string,
// uses global.script_array2 for input, specify type
use_type=argument0; // 0=string, 1=int, 2=real, 3=bool
w=argument1;
h=argument2;
sep1=argument3;
sep2=argument4;
out="";
if ( use_type == 0 ) { // string
 for ( i=0; i<w; i++ )  {
  for ( j=0; j<h; j++ ) {
   out+=global.script_array2[i,j]+sep1;
  }
  out+=sep2;
 }
} else if ( use_type == 1 ) { // int
 for ( i=0; i<w; i++ )  {
  for ( j=0; j<h; j++ ) {
   out+=int(global.script_array2[i,j])+sep1;
  }
  out+=sep2;
 }
} else if ( use_type == 2 ) { // real
 for ( i=0; i<w; i++ )  {
  for ( j=0; j<h; j++ ) {
   out+=float(global.script_array2[i,j])+sep1;
  }
  out+=sep2;
 }
} else if ( use_type == 3 ) { // bool
 for ( i=0; i<w; i++ )  {
  for ( j=0; j<h; j++ ) {
   out+=s_bool(global.script_array2[i,j])+sep1;
  }
  out+=sep2;
 }
}
return out;
