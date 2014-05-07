var r,u,n,msg_type,msg_data,delay;

r=argument0;
u=argument1;
n=argument2;
msg_type=argument3;
msg_data=argument4;
delay=argument5+(1/room_speed);

var idx;
idx=global.instance_messages_pending;
global.instance_message_room[idx]=r;
global.instance_message_uid[idx]=u;
global.instance_message_number[idx]=n;
global.instance_message_type[idx]=msg_type;
global.instance_message_data[idx]=msg_data;
global.instance_message_delay[idx]=delay;
global.instance_messages_pending+=1;
