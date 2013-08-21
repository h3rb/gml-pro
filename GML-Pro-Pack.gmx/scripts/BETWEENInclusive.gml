var v,A,B;
v=argument0;
A=argument1;
B=argument2;
if ( A<B ) {
 if ( v>=A && v<=B ) return true;
} else {
 if ( v<=A && v>=B ) return true;
}
return false;
