var ecks,why,angle,screenw,screenh,
gridx,gridy,gtx,gty,gridw,gridh,dx,dy,tx,ty;
ecks=argument0;
why=argument1;
angle=argument2;
screenw=argument3;
screenh=argument4;
gridx=argument5;
gridy=argument6;
gridw=argument7;
gridh=argument8;
dx=screenw/gridw;
dy=screenh/gridh;
gtx=gridx-gridw/2;
gty=gridy-gridh/2;
rotate_point(-degtorad(angle),gtx,gty);
tx=ecks+global.script_rotate_point_x*dx;
ty=why+global.script_rotate_point_y*dy;
return st_vec2d_set(tx,ty);
