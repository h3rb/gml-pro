var x1,y1,z1,x2,y2,z2,d2d;
x1 = argument0
y1 = argument1
z1 = argument2
x2 = argument3
y2 = argument4
z2 = argument5
d2d = point_distance(x1,y1,x2,y2);
return sqrt(((d2d*d2d)+((z2-z1)*(z2-z1))));
