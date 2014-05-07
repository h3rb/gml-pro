// A Point Stack is a series of points that are position-relative, forming some sort of
// path, which can be popped and pushed.  A position within the stack can be approximated
// from a 0-1.0 request, which approximates the position based on the value, or you can
// use the internal position which can be moved toward or away from one end by a fractional
// amount.  Given points A B C D in an example stack, 0.5 external position request would
// a point halfway between B and C, whereas a fractional increase from 0.0 of 0.125 would give
// you a position halfway between A and B, then B, then halfway between B and C...etc.
var stack,exploded,lerped,candidate,next,rx1,ry1,rx2,ry2;
stack=argument0;
lerped=argument1; // must be 0-1.0
exploded=string_split(stack,global.d2);
candidate=exploded*lerped;
if ( candidate == exploded ) candidate=exploded-1;
if ( candidate == exploded-1 ) {
 st_vec2d_get(global.script_string_split[candidate]);
 global.script_pointstack_x=global.vec_x;
 global.script_pointstack_y=global.vec_y;
} else {
 next=candidate+1;
 st_vec2d_get(global.script_string_split[candidate]);
 rx1=global.vec_x;
 ry1=global.vec_y;
 st_vec2d_get(global.script_string_split[next]);
 rx2=global.vec_x;
 ry2=global.vec_y;
 get_point_on_line(rx1,ry1,rx2,ry2,lerped);
}
