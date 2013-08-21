// Treats a string as a 2 dimensional array, get value at x,y
// string arrays are unsigned 7-bit numbers (valid range 0-240, so EOL never appears in an array)
// of max size 240x240, min size of 1x1, storing the dimensions as indices [1],[2]
// sa_new(w,h)
// This allocates a string of w*h size and returns it.
// Initializes to 0
var i,j,w,h,out,size;
w=argument0;
h=argument1;
if ( w < 1 || h < 1 ) return "invalid";
out="";
out+=chr(w+15.0);
out+=chr(h+15.0);
size=w*h;
for ( i=0; i<size; i++ ) out+=chr(15);
return out;
