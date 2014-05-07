// notch (a color filter)
// notch(c)  -- return a random notched version of provided color
// notch(c,t) -- return a specifically notched channel 0=r,1=g,2=b
// notch(c,t,f) -- return a specifically notched channel floored to f
var c,f,r,v;
c=argument0;
if ( argument_count == 3 ) {
 t=argument1;
 f=argument2;
 if ( t == 0 ) return make_color_rgb(f,green(c),blue(c));
 else if ( t == 1 ) return make_color_rgb(red(c),f,blue(c));
 else if ( t == 2 ) return make_color_rgb(red(c),green(c),f);
}
if ( argument_count == 2 ) {
 t=argument1;
 if ( t == 0 ) return make_color_rgb(f,green(c),blue(c));
 else if ( t == 1 ) return make_color_rgb(red(c),f,blue(c));
 else if ( t == 2 ) return make_color_rgb(red(c),green(c),f);
} else {
 r=random(3+0.001);
 if ( r <= 1.0 ) return make_color_rgb(red(c),green(c),0.0);
 else if ( r <= 2.0 ) return make_color_rgb(red(c),0.0,blue(c));
 else if ( r <= 3.0 ) return make_color_rgb(0.0,green(c),blue(c));
}
