var txt,w;
txt=argument0;
w=argument1;

//draw_set_font(font); before calling this

var len;
len=string_length(txt);

var drawn;
drawn=string_width(txt);

if ( drawn <= w ) return txt;

while ( drawn > w ) {
 txt=string_copy(txt,0,len-1);
 len-=1;
 drawn=string_width(txt);
}

txt=string_copy(txt,0,len-3)+"..";
return txt;
