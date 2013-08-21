var s;
s=argument0;
var i;
i=string_split(s,global.d);
global.cargo_scratch_total=i;
var j;
for ( j=0; j<i; j++ ) {
 string_split2(global.script_string_split[j],global.d2);
 global.cargo_scratch_contents[j]=global.script_string_split2[0];
 global.cargo_scratch_type[j]=real(global.script_string_split2[1]);
}
