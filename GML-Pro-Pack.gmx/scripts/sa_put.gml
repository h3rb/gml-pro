// Treats a string as a 2 dimensional array, get value at x,y
// string arrays are unsigned 7-bit numbers (valid range 0-240, so EOL never appears in an array)
// sa_put(stringarray,x,y,value)
// returns the array with the new value in it or throws an error if out of range
var in,ecks,why,len,size,vector,linear,wch,hch,value,w,h,out;
stringarray=argument0;
ecks=argument1;
why=argument2;
value=argument3;
if ( value > 240 or value < 0 ) {
 show_message("sa_put: Error, supplied value "+int(value)+" is out of range, statement had no effect");
 return stringarray;
}
len=string_length(stringarray);
size=len-2;
if ( len <= 3 ) {
 show_message("sa_get() Error: invalid array provided, array was empty or invalid");
 return -1;
}
wch=string_char_at(stringarray,1);
w=ord(wch)-15.0;
hch=string_char_at(stringarray,2);
h=ord(hch)-15.0;
linear=ecks+why*w;
vector=2+1+linear;
if ( vector-2 > size ) {
 show_message("sa_get() Error: String was not wide enough to accomodate position "+int(ecks)+","+int(why));
 return stringarray;
} 
out=wch+hch;
out+=string_copy(stringarray,3,linear);
out+=chr(value+15);
out+=string_copy(stringarray,vector+1,size-(linear));
return out;
