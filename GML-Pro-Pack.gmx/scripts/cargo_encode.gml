var o;
o=argument0;
var s;
s="";
for ( i=0; i<o.cargo; i++ ) {
 s+=o.cargo_contents[i]+global.d2+int(o.cargo_type[i]);
 s+=global.d;
}
return s;
