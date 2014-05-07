var ecks,why,w,chover,cselect,cnormal,label;
ecks=argument0;
why=argument1;

var h;
h=32;

var mx,my,c,selecting,hovering;
mx=mouse_x;
my=mouse_y;

clicking=mouse_check_button(mb_any);
hovering=WITHIN(mouse_x,mouse_y,ecks,why,ecks+w,why+h);
selecting=hovering and clicking;

if ( selecting ) {
 c=cselect;
} else if ( hovering ) {
 c=chover;
} else {
 c=cnormal;
}

draw_set_color(c);
draw_set_alpha(1);
draw_sprite_stretched(s_textboxbg,0,ecks,why,w,h);

draw_set_font(font_emu);
var txt;
txt=trunc_fit(label,w-16);
draw_text_color(ecks+8,why+8,txt,c_lime,c_lime,c_lime,c_lime,1);
