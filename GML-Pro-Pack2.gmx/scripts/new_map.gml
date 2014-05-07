var n,w,h,i,j;
n=argument0;
w=argument1;
h=argument2;
global.map_w[n]=w;
global.map_h[n]=h;
global.map_size[n]=w*h;
for ( i=0; i<w; i++ ) for ( j=0; j<h; j++ ) {
 global.map[n,i+j*w]=-1;
 global.mtileset[n,i+j*w]=0;
 global.mcode[n,i+j*w]=0;
 global.mcolor[n,i+j*w]=c_white;
 global.malpha[n,i+j*w]=1.0;
 global.mblend[n,i+j*w]=0;
 global.mobj[n,i+j*w]=-1;
 global.mobj2[n,i+j*w]=-1;
 global.mlight[n,i+j*w]=-1;
 global.mlightc[n,i+j*w]=c_white;
}

global.map_lights=0;
global.map_light[0]=0;
global.map_light_color[0]=c_white;
global.map_light_tween[0]=0;
global.map_light_x[0]=0;
global.map_light_y[0]=0;
global.map_light_type[0]=0;

global.map_objects=0;
global.map_object[0]=0;
global.map_object_x[0]=0;
global.map_object_y[0]=0;

global.map_decals=0;
global.map_decal[0]=0;
global.map_decal_x[0]=0;
global.map_decal_y[0]=0;
global.map_decal_color[0]=0;
global.map_decal_layer[0]=0;
global.map_decal_xscale[0]=0;
global.map_decal_yscale[0]=0;

