var ecks;
var why;
ecks=argument0; // untranslated x,y of position relative to origin
why=argument1;


rotate_point(degtorad(global.player.image_angle),ecks-global.player.x,why-global.player.y);
global.screen_x=global.script_rotate_point_x+global.cx;
global.screen_y=global.script_rotate_point_y+global.cy;
