var in,use_type,sep1,sep2,w,h,i,j,e,f;
// Converts a provided string to a bidimensional array,
// using global.script_array2 for output, specify type
// Uses global.script_split_lines as a cache
in=argument0;
use_type=argument1; // 0=string, 1=int, 2=real, 3=bool
sep1=argument2;
sep2=argument3;

if ( use_type == 0 ) { // string
 e=string_split(in,sep2);
 for ( j=0; j<e; j++ ) {
  f=string_split2(global.script_split_lines[j],sep1);
  for ( i=0; i<f; i++ ) {
   global.script_array2[i,j]=global.script_split_lines2[i];
  }
 }
} else if ( use_type == 1 ) { // int
 e=string_split(in,sep2);
 for ( j=0; j<e; j++ ) {
  f=string_split2(global.script_split_lines[j],sep1);
  for ( i=0; i<f; i++ ) {
   global.script_array2[i,j]=real(global.script_split_lines2[i]);
  }
 }
} else if ( use_type == 2 ) { // real
 e=string_split(in,sep2);
 for ( j=0; j<e; j++ ) {
  f=string_split2(global.script_split_lines[j],sep1);
  for ( i=0; i<f; i++ ) {
   global.script_array2[i,j]=real(global.script_split_lines2[i]);
  }
 }
} else if ( use_type == 3 ) { // bool
 e=string_split(in,sep2);
 for ( j=0; j<e; j++ ) {
  f=string_split2(global.script_split_lines[j],sep1);
  for ( i=0; i<f; i++ ) {
   global.script_array2[i,j]=to_bool(global.script_split_lines2[i]);
  }
 }
}

