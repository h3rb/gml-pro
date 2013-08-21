var out,l,i,j,fp;
fp=bin_open_read(argument0);
for ( l=0; l<10; l++ ) {
 for ( i=0; i<170; i++ ) {
  for ( j=0; j<170; j++ ) {
   global.map[l,i+j*global.map_w[l]]=bin_read_int(fp);
   global.mtileset[l,i+j*global.map_w[l]]=bin_read_int(fp);
   global.mcode[l,i+j*global.map_w[l]]=bin_read_int(fp);
   global.mcolor[l,i+j*global.map_w[l]]=bin_read_color(fp);
   global.malpha[l,i+j*global.map_w[l]]=bin_read_real100k(fp);
   global.mblend[l,i+j*global.map_w[l]]=bin_read_int(fp);
   global.mobj[l,i+j*global.map_w[l]]=bin_read_int(fp);
   global.mobj2[l,i+j*global.map_w[l]]=bin_read_int(fp);
   global.mlight[l,i+j*global.map_w[l]]=bin_read_int(fp);
   global.mlightc[l,i+j*global.map_w[l]]=bin_read_color(fp);
   //show_message(int(j)+"/"+int(global.map_h[l]));
  }
  //show_message(int(i)+"/"+int(global.map_w[l]));
 }
 //show_message(int(l));
}

//show_message("1");

global.map_lights=bin_read_int(fp);
for ( i=0; i<global.map_lights; i++ ) {
 global.map_light[i]=bin_read_int(fp);
 global.map_light_color[i]=bin_read_color(fp);
 global.map_light_tween[i]=bin_read_int(fp);
 global.map_light_x[i]=bin_read_int(fp);
 global.map_light_y[i]=bin_read_int(fp);
 global.map_light_type[i]=bin_read_int(fp);
}

//show_message("2");

global.map_objects=bin_read_int(fp);
for ( i=0; i<global.map_objects; i++ ) {
 global.map_object[i]=bin_read_int(fp);
 global.map_object_x[i]=bin_read_int(fp);
 global.map_object_y[i]=bin_read_int(fp);
}
bin_close(fp);
