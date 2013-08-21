// Update -----------------------------------------------------------------



// Render -----------------------------------------------------------------

// Tile section

// Render the background
surface_set_target(global.s_screen);

var i,j,mx,my,ox,oy,rw,rh;

rw=room_width/64+1;
rh=room_height/64+1;
mrx=argument0/64;
mry=argument1/64;
mtx=mx+real(int(mrx));
mty=my+real(int(mry));
ax=mx*64+argument0;
ay=my*64+argument1;
ox=argument0-(real(int(mrx))*64);
oy=argument1-(real(int(mry))*64);


for (i=mx;i<mx+rw;i++) {
 for (j=my;j<my+rh;j++) {
  if ( WITHIN(i,j,0,0,global.map_w[layer],global.map_h[layer]) ) {
   var v,s,a,b,c,a,m,t;
   v=i+j*global.map_w[layer];
   s= global.map[layer,v];
   b= global.mblend[layer,v];
   c= global.mcolor[layer,v];
   a= global.malpha[layer,v];
   t= global.mtileset[layer,v];
   if ( s >= 0 ) {
    draw_set_blend_mode(b);
    draw_sprite_ext(tileset_presets[t],s,(i-mx)*64,(j-my)*64,1,1,0,c,a);
   }
   if ( global.mlight[layer,v] >= 0 ) {
    draw_set_color(global.mlightc[layer,v]);
    draw_rectangle((i-mx)*64-5,(j-my)*64-5,(i-mx)*64+5,(j-my)*64+5,false);
   }
   m= global.mcode[layer,v];
  }
 }
}
