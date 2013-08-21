// finds the nearest solid point in the starship's grid
var ecks,why,iid,w,h,scw,sch,sw,sh,scsw,scsh,ox,oy,ix,iy;
iid=argument0;
ecks=argument1;
why=argument2;

w=iid.damage_w;
h=iid.damage_h;

// find sprite's width/height on screen
sw=sprite_get_width(iid.sprite_index);
sh=sprite_get_height(iid.sprite_index);
scw=(iid.image_xscale*sw);
sch=(iid.image_yscale*sh);
//scsw=scw/sw;
//scsh=sch/sh;
rotate_point(degtorad(iid.image_angle),ecks-iid.x,why-iid.y);
ox=global.script_rotate_point_x;
oy=global.script_rotate_point_y;
ix=(ox+scw/2)/scw;
iy=(oy+sch/2)/sch;
global.nearest_ship_x=ix*w;
global.nearest_ship_y=iy*h;
if ( global.nearest_ship_x > w-1 ) global.nearest_ship_x=w-1;
if ( global.nearest_ship_y > h-1 ) global.nearest_ship_y=h-1;
//show_message(int(ix*w)+","+int(iy*h)+" ... "+float(ix*w)+","+float(iy*h));
//return st_vec2d_set(global.nearest_ship_x,global.nearest_ship_y);
