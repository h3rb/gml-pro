var o; // public rads,cost,sint;
o=argument0;
rads=degtorad(-norm_deg(o.direction)-90.0);
cost=cos(rads);
sint=sin(rads);
dx=cost*o.velocity;
dy=sint*o.velocity;

o.x+=dx;
o.y+=dy;

// Any children objects ...
if ( o.targetinfo != noone ) {
 o.targetinfo.x+=dx;
 o.targetinfo.y+=dy;
}
