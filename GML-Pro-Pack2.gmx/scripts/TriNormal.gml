var
 ax,ay,az,bx,by,bz,
 V1x,V1y,V1z,
 V2x,V2y,V2z,
 V3x,V3y,V3z;
st_vec3d_get(argument0);
V1x=global.vec_x;
V1y=global.vec_y;
V1z=global.vec_z;
st_vec3d_get(argument1);
V2x=global.vec_x;
V2y=global.vec_y;
V2z=global.vec_z;
st_vec3d_get(argument2);
V3x=global.vec_x;
V3y=global.vec_y;
V3z=global.vec_z;

ax=V1x-V2x;
ay=V1y-V2y;
az=V1z-V2z;

bx=V3x-V1x;
by=V3y-V1y;
bz=V3z-V1z;

return st_vec3d_set(
 ay*bz - az*by,
 ax*bz - az*bx,
 ax*by - ay*bx
); // Cross Product
