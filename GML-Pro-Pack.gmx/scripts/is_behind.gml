var ecks,why,directionDeg,x2,y2,testAngle;
ecks=argument0;
why=argument1;
directionDeg=argument2;
x2=argument3;
y2=argument4;
testAngle=argument5;

var a;
a=LineAngle(ecks,why,x2,y2);

var u,d;
u=norm_deg(directionDeg);
d=norm_deg(a);
if ( u < d ) {
 var t;
 t=u;
 u=d;
 d=t;
}
a=u-d;
return (a>testAngle);
