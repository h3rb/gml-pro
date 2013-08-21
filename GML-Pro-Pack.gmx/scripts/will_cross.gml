var s,d,l;
s=argument0; //value
d=argument1; //delta
l=argument2; //limit

if ( d > 0 ) {
 if ( s < l and s+d >= l ) return true;
} else {
 if ( s > l and s+d <= l ) return true;
}

return false;
// Could be s==l, or that s+d or s-d will not cross.
//  Check for s==l prior to calling this.
// Also could mean d=0
