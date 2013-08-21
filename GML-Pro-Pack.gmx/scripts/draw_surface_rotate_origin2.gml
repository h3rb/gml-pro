/* // source: http://gmc.yoyogames.com/index.php?showtopic=368851
draw_surface_rotate_origin
argument 0 = surface id
argument 1 = local origin x
argument 2 = local origin y
argument 3 = x
argument 4 = y
argument 5 = xscale
argument 6 = yscale
argument 7 = angle
argument 8 = color
argument 9 = alpha
*/

var sid,ox,oy,ecks,why,xscale,yscale,angle,color,alpha,sw,sh,rx,ry;
sid=argument0;
ox=argument1;
oy=argument2;
ecks=argument3;
why=argument4;
xscale=argument5;
yscale=argument6;
angle=argument7;
color=argument8;
alpha=argument9;
sw=surface_get_width(sid);
sh=surface_get_height(sid);
rx=sw-ox;
ry=sh-oy;
rotate_point(angle,ox,oy);
draw_surface_general(sid,0,0,ox,oy,ecks,why,
 xscale,yscale,rot,color,color,color,color,alpha);

pw2 = surface_get_width(argument0) - pw1
ph2 = surface_get_height(argument0) - ph1
draw_surface_general(argument0, pw1, ph1, -pw1, -ph1, argument3, argument4, argument5,
 argument6,argument7,argument8,argument8,argument8,
argument8,argument9)
draw_surface_general(argument0, pw1, ph1+1, -pw1, ph2, argument3, argument4, argument5,
 argument6,argument7,argument8,argument8,argument8,
argument8,argument9)
draw_surface_general(argument0, pw1+1, ph1, pw2, -ph1, argument3, argument4, argument5,
 argument6,argument7,argument8,argument8,argument8,
argument8,argument9)
draw_surface_general(argument0, pw1+1, ph1+1, pw2, ph2, argument3, argument4, argument5,
 argument6,argument7,argument8,argument8,argument8,
argument8,argument9)
