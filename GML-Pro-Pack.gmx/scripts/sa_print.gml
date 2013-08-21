var stringarray,size,len,dim_x,dim_y,i,j,out;
stringarray=argument0;
// Returns the dimensions of a string array into global.script_sa_dim_x, global.script_sa_dim_y;
var stringarray,size;
stringarray=argument0;
len=string_length(stringarray);
size=len-2;
if ( size < 3 ) {
 show_message("sa_print() Error: invalid array provided, array was empty or invalid, size:"+int(size));
 return -1;
}
dim_x=ord(string_char_at(stringarray,1))-15.0;
dim_y=ord(string_char_at(stringarray,2))-15.0;
out="String array ";
out+=int(dim_x);
out+="x";
out+=int(dim_y);
out+=chr(13);
for ( j=0; j<dim_y; j++ ) {
 for ( i=0; i<dim_x; i++ ) {
  out+=int(sa_get(stringarray,i,j));
 }
 out+=chr(13);
}
return out;
