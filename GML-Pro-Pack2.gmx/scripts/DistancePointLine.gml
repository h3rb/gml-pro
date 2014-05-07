var px,py,pz,x1,y1,z1,x2,y2,z2,U,intersectionx,intersectiony,intersectionz,LineMag;
px=argument0;
py=argument1;
pz=argument2;
x1=argument3;
y1=argument4;
z1=argument5;
x2=argument6;
y2=argument7;
z2=argument8;
LineMag = LineMagnitude(x1,y1,z1,x2,y2,z2);
U = ( ( ( px - x1 ) * ( x2 - x1 ) )
    + ( ( py - y1 ) * ( y2 - y1 ) )
    + ( ( pz - z1 ) * ( z2 - z1 ) ) ) / SQ( LineMag );
if ( U < 0.0 || U > 1.0 ) return -1;   // closest point does not fall within the line segment
intersectionx = x1 + U * ( x2 - x1 );
intersectiony = y1 + U * ( y2 - y1 );
intersectionz = z1 + U * ( z2 - z1 );
return LineMagnitude( px,py,pz,intersectionx,intersectiony,intersectionz );
