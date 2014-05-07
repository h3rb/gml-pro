// surface_create_color_alpha(width, height, color, alpha)
// source: http://gmc.yoyogames.com/index.php?showtopic=426939
var s;
	s = surface_create(argument0, argument1);
if (s >= 0) {
	surface_set_target(s);
	draw_clear_alpha(argument2, argument3);
	surface_reset_target();
}
return s;
