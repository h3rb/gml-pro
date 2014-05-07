var tx,ty,label,width,roomid,semaphore;
tx=argument0;
ty=argument1;
label=argument2;
width=argument3;
roomid=argument4;
semaphore=argument5;

o=instance_create(tx,ty,o_g_button);
o.label=argument2;
o.image_xscale=width;
o.target_id=roomid;
o.semaphore=semaphore;
return o;
