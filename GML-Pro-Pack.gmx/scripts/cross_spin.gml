var cx,cy,hx,hy;
// From a normalized rotation with the nose facing up, determine spin direction from a collision
// this is a cheap fix, fix this.
cx=argument0;
cy=argument1;
hx=argument2;
hy=argument3;

if ( cx > hx ) {
 if ( cy > hy ) {
  return 1;
 } else {
  return -1;
 }
} else {
 if ( cy > hy ) {
  return -1;
 } else {
  return 1;
 }
}
