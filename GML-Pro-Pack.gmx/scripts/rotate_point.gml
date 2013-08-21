var angle_rads,px,py,cost,sint;
angle_rads=argument0;
px=argument1;
py=argument2;
cost=cos(angle_rads);
sint=sin(angle_rads);
global.script_rotate_point_x=(px*cost-py*sint);
global.script_rotate_point_y=(px*sint+py*cost);
