var v,t,d;
v=argument0;
t=argument1;
d=argument2;
if ( BETWEEN(v,(t)-(d),(t)+(d)) ) return 0;
else if( (t)>v ) return d;
else if( (t)<v ) return -d;
return 0;
