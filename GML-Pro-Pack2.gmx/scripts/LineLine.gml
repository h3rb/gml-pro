 // Source: Paul Bourke
 // Incorrectly returns the midpoint of the test line (this)
 // as the collision point when test against line has length of 0,
 // so we use Paeth's PntOnLine function to guestimate collision.
 // Because PntOnLine is integer-based, so normalized values will
 // all collide at their integer equivalents 0,1 (so we scale by
 // an arbitrary value of 100)
var ax,ay,ax2,ay2,bx,by,bx2,by2;
ax=argument0;
ay=argument1;
ax2=argument2;
ay2=argument3;
bx=argument4;
by=argument5;
bx2=argument6;
by2=argument7;

  if ( bx==bx2 and by==by2 ) {
   var res;
   res=point_on_line(
    (ax*100.0),
    (ay*100.0),
    (ax2*100.0),
    (ay2*100.0),
    (bx*100.0),
    (by*100.0)
   );
   global.script_lineline_x=bx;
   global.script_lineline_y=by;
   global.script_lineline=(res!=2);
   return global.script_lineline;
  } else
  if ( ax==x2 && ay==y2 ) {
   var res;
   res=point_on_line(
    (bx*100.0),
    (by*100.0),
    (bx2*100.0),
    (by2*100.0),
    (ax*100.0),
    (ay*100.0)
   );
   global.script_lineline_x=ax;
   global.script_lineline_y=ay;
   global.script_lineline=(res!=2);
   return global.script_lineline;
  }
  var mua,mub;
  var denom,numera,numerb;
  denom  = (by2-by) * (ax2-ax) - (bx2-bx) * (y2-y);
  numera = (bx2-bx) * (ay-by)  - (by2-by) * (x-bx);
  numerb = (ax2-ax) * (ay-by)  - (ay2-ay) * (x-bx);
  /* Are the line coincident? */
  if (abs(numera) < 0.000001 && abs(numerb) < 0.000001 && abs(denom) < 0.000001) {
   global.script_lineline_x = (ax + ax2) / 2.0;
   global.script_lineline_y = (ay + ay2) / 2.0;
   return true;
  }
  /* Are the line parallel */
  if (abs(denom) < 0.000001 ) {
   global.script_lineline_x = 0.0;
   global.script_lineline_y = 0.0;
   return false;
  }
  /* Is the intersection along the the segments */
  mua = numera / denom;
  mub = numerb / denom;
  if (mua < 0.0 || mua > 1.0 || mub < 0.0 || mub > 1.0) {
   global.script_lineline_x = 0.0;
   global.script_lineline_y = 0.0;
   return false;
  }
  global.script_lineline_x = ax + mua * (ax2 - ax);
  global.script_lineline_y = ay + mua * (ay2 - ay);
  return true;
