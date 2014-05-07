// Treats a string as a 2 dimensional array, get value at x,y
// string arrays are unsigned 7-bit numbers (valid range 0-240, so EOL never appears in an array)
// sa_get(stringarray,x,y)
// Checks if x+y*w falls within the array's allocated range
// Returns -1 if not, or the value as a real()
var stringarray,ecks,why,len,size,w,h,vector;
stringarray=argument0;
ecks=argument1;
why=argument2;
len=string_length(stringarray);
size=len-2;
if ( len <= 3 ) {
 show_message("sa_get() Error: invalid array provided, array was empty or invalid, size:"+int(size));
 return -1;
}
w=ord(string_char_at(stringarray,1))-15.0;
h=ord(string_char_at(stringarray,2))-15.0;
linear=ecks+why*w;
vector=2+1+linear;
if ( vector-2 > size ) {
 show_message("sa_get() Error: String was not wide enough to accomodate position "+int(ecks)+","+int(why));
 return -1;
} else {
 return ord(string_char_at(stringarray,vector))-15.0;
}
