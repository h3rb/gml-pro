var r,i;
r=rows("Elements");
i=real(int(number_range(0,r)));
if ( i >= r ) i=0;
return i;//get("Elements",i,"Name");
