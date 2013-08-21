var r,n,t,d;
r=argument0; // room
n=argument1; // obj
t=argument2; // message type
d=argument3; // data string

// interpret based on room type
if ( r == rm_trade ) {
 global.trading_with=real(d);
 show_message("Trading with "+d);
}

return false; // deletes the message, otherwise if true it recurs the next frame!
