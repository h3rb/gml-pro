var o;
o=argument0;

var t; // systems 0,1,2,3,4
t=argument1;

var x1,y1,x2,y2;  // from the top left, in sprite pixels
x1=argument2;
y1=argument3;
x2=argument4;
y2=argument5;

var s1,e1,s2,e2;
s1=x1/o.damage_w;
e1=x2/o.damage_w;
s2=y1/o.damage_h;
e2=y2/o.damage_h;

if ( s1 == s2 ) s2=s1+1;
if ( e1 == e2 ) e2=e1+1;

var sw,sh;
sw=sprite_get_width(o.sprite);
sh=sprite_get_height(o.sprite);

var i,j;
for ( i=s1; i<e1; i++ ) {
 for ( j=s2; j<e2; j++ ) {
  o.sectiontype[i,j]=t;
 }
}

