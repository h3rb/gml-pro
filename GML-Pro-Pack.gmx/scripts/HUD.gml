// Draws the HUD

if ( global.HUD_mode == 1 ) { // Starship HUD
 draw_bargraph(32,32,"HULL",global.player_ship_hp/100.0,128,c_green,1.0);
 var p;
 p=global.player;
// if ( p.draw_mouse_coordinates ) {
//  draw_set_color(c_lime);
//  draw_text(mouse_x+32,mouse_y+32,int(mouse_x)+","+int(mouse_y));
// }
 draw_set_color(c_green);
 draw_text(room_width-200,5,int(p.x)+":"+int(p.y)); 
}
