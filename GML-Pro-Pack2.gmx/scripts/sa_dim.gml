// Returns the dimensions of a string array into global.script_sa_dim_x, global.script_sa_dim_y;
var stringarray,size;
stringarray=argument0;
size=string_length(stringarray)-2;
if ( size < 3 ) {
 show_message("sa_get() Error: invalid array provided, array was empty or invalid");
 return -1;
}
global.script_sa_dim_x=ord(string_char_at(stringarray,1))-15.0;
global.script_sa_dim_y=ord(string_char_at(stringarray,2))-15.0;
