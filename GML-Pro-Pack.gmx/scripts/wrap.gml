var c,a,b,d;
c=argument0
a=argument1
b=argument2
d=b-a;
if ( c >= a && c <= b ) return c;
while( c > b ) c-=d;
while( c < a ) c+=d;
return c;
