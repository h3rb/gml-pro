var r,i;
r=rows("Compounds");
//show_message(int(r));
i=real(int(random(r)));
if ( i >= r ) i=0;
//show_message(int(i));
return i;// get("Compounds",i,"Name");
