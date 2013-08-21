var o,s;
o=argument0;
s=argument1;
var i;
i=string_split(s,global.d);
o.cargo=i;
var j;
for ( j=0; j<i; j++ ) {
 string_split2(global.script_string_split[j],global.d2);
 o.cargo_contents[j]=global.script_string_split2[0];
 o.cargo_type[j]=real(global.script_string_split2[1]);
}
