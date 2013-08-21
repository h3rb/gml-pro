var percent;
percent=argument0;
percent-=0.25;
if ( percent <= 0 ) return c_black;
if ( percent <= 0.25 ) return c_red;
if ( percent <= 0.50 ) return c_orange;
if ( percent <= 0.75 ) return c_olive;
return c_lime;
