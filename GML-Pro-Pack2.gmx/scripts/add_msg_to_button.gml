var b,j;
b=argument0; // button object
j=b.msgs;
b.mr[j]=argument1; // source room
b.mu[j]=argument2; // uid
b.mn[j]=argument3; // message code num
b.mt[j]=argument4; // message type
b.md[j]=argument5; // message data
b.mdelay[j]=argument6; // delay (in seconds) until recv
b.msgs+=1;
