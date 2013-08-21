var color,colorout,alpha,ecks,why,label,percent,w;

ecks=argument0;
why=argument1;
label=argument2;
percent=argument3;
w=argument4;
color=argument5;
alpha=argument6;

if ( percent > 0.0 ) {
 colorout=merge_color(color,c_black,0.65);
 draw_set_alpha(alpha);
 draw_roundrect_color(ecks-2,why-2,ecks+w+2,why+8+2,colorout,colorout,1);
 draw_roundrect_color(ecks,why,ecks+w*percent,why+8,color,color,0);
 draw_set_alpha(1.0);
}
