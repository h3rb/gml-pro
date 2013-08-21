// A Point Stack is a series of points that are position-relative, forming some sort of
// path, which can be popped and pushed.  A position within the stack can be approximated
// from a 0-1.0 request, which approximates the position based on the value, or you can
// use the internal position which can be moved toward or away from one end by a fractional
// amount.  Given points A B C D in an example stack, 0.5 external position request would
// a point halfway between B and C, whereas a fractional increase from 0.0 of 0.125 would give
// you a position halfway between A and B, then B, then halfway between B and C...etc.
var ecks,why,stack;
ecks=argument0;
why=argument1;
stack=argument2;
return stack+st_vec2d_set(ecks,why)+global.d2; // delim is not set between because it has already been placed..
