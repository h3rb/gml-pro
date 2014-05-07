var value,total,label,maximum,out,len;
value=argument0;
total=argument1;
label=argument2;
maximum=argument3;
if ( value > total ) {
 value=total;
 spacer="+";
} else spacer=" ";
out="[";
for ( i=0; i<=value; i++ ) {
 out+="\#";
}
rest=total-value;
for ( i=0; i<rest; i++ ) {
 out+=" ";
}
out+="]"+spacer+label;
len=string_length(out);
maximum+=string_count("\",out);
if ( len < maximum ) {
 return out+string_repeat(" ",maximum-len);
} else if ( len == maximum ) return out;
else {
 return string_copy(out,1,maximum);
}
