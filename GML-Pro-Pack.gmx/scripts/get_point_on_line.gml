// Returns a point on a line
var x1,y1,x2,y2,lerped;
x1=argument0;
y1=argument1;
x2=argument2;
y2=argument3;
lerped=argument4;
global.script_get_point_x=x1+(x2-x1)*lerped;
global.script_get_point_y=y1+(y2-y1)*lerped;
