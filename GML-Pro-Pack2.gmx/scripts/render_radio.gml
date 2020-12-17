if ( global.radio_queue > 0 ) {
 var fadeLength=global.radio_fade*global.radio_duration[0];
 var remainder=global.radio_duration[0]-fadeLength;
 var instant=global.radio_instant;
 var a=1.0;
 if ( instant > remainder ) {
  a=1.0-(instant-remainder)/fadeLength;
 } else if ( instant < fadeLength ) {
  a=instant/fadeLength;
 }
 draw_set_blend_mode(bm_normal);
 draw_set_alpha(a);
 // caption 
 var len=string_length(global.radio_caption[0]);
 var capw=len*16;
 draw_set_color(global.radio_captionbg);
 draw_rectangle(32,8,32+capw,8+16,false);
 draw_set_color(global.radio_captionborder); 
 draw_rectangle(32,8,32+capw,8+16,true);
 draw_set_font(font_mini9);
 draw_set_color(c_black);
 draw_text(32+8,8+4,global.radio_caption[0]);
 draw_set_color(global.radio_color[0]);
 draw_text(32+8+1,8+4-1,global.radio_caption[0]);
 // background
 var newlines=lines(global.radio_string[0]);
 var h=(8+64+8)+floor((newlines-4)*16);
 var tw=longest_line(global.radio_string[0])*16;
 draw_set_alpha(a*0.8);
 draw_set_color(global.radio_bgcolor[0]); 
 draw_set_alpha(a);
 draw_roundrect(8,8+16,global.width/4-8,8+16+h,false);
 // content
 draw_set_color(global.radio_color[0]);
 draw_set_font(font_lcd7);
 draw_text_ext(
  8+64+8,8+16+8,
  global.radio_string[0],2+16,
  global.width/4-8-8-64-8-8
 );
 // icon
 draw_sprite_best_fit_rectangle(
  global.radio_icon[0],
  global.radio_sub[0],
  8+8,8+8+8, // not sure why i need another +8
  8+8+64,8+8+64,
  0.0,
  global.radio_tint[0],
  a
 );
 global.radio_sub[0]+=global.radio_dsub[0];
 draw_set_alpha(1.0);
}
