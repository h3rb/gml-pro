var s;
s="";
for ( i=0; i<o.cargo_scratch_total; i++ ) {
 s+=global.cargo_scratch_contents[i]+global.d2+global.cargo_scratch_type[i];
 s+=global.d;
}
return s;
