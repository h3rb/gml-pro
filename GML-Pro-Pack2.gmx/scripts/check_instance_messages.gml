// Checks for messages for provided iid, or for the current room, and acts upon them, then disposes of them.
var o,uid,iid;
iid=argument0;
o=iid.object_index;
uid=iid.uid;
if ( global.instance_messages_send ) {//
 var i,
  new_,new_r,new_u,new_n,new_t,new_d,new_delay,store;
 new_=0;
 new_r[0]=noone;
 new_u[0]=noone;
 new_n[0]=0;
 new_t[0]=0;
 new_d[0]="";
 new_delay[0]=0;
 store=false;
 for ( i=0; i<global.instance_messages_pending; i++ ) {
  if ( global.instance_message_room[i] == room ) {
   if ( global.instance_message_delay[i] <= 0.0 ) {
    store=false;
    if ( global.instance_message_uid[i] == noone ) interpret_room_message(
     room,
     global.instance_message_number[i],
     global.instance_message_type[i],
     global.instance_message_data[i],
    );
    else if ( uid == global.instance_message_uid[i] ) interpret_instance_message(
     room,o,iid,
     global.instance_message_number[i],
     global.instance_message_type[i],
     global.instance_message_data[i],
    );
    else store=true;
   } else store=true;
  } else store=true;
  if ( store ) { // Store in the still pending list
   new_r[new_]=global.instance_message_room[i];
   new_u[new_]=global.instance_message_uid[i];
   new_n[new_]=global.instance_message_number[i];
   new_t[new_]=global.instance_message_type[i];
   new_d[new_]=global.instance_message_data[i];
   new_delay[new_]=global.instance_message_delay[i];
   new_+=1;
  }
 }
 // Copy back remaining messages
 for ( i=0; i<new_; i++ ) {
  global.instance_message_room[i]    =new_r[i];
  global.instance_message_uid[i]     =new_u[i];
  global.instance_message_number[i]  =new_n[i];
  global.instance_message_type[i]    =new_t[i];
  global.instance_message_data[i]    =new_d[i];
  global.instance_message_delay[i]   =new_delay[i];
 }
 global.instance_messages_pending=new_;
}//
