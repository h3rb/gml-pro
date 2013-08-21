var in,r,g,b,a;
in=argument0;
a=argument1;
r=color_get_red(in);
g=color_get_green(in);
b=color_get_blue(in);
return make_color_rgb(r*a,g*a,b*a);
