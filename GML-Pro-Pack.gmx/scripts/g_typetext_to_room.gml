var ecks,why,text,endpauselength,target,semaphore,o;
ecks=argument[0];
why=argument[1];
text=argument[2];
endpauselength=argument[3];
target=argument[4];
if ( argument_count > 4 ) {
 semaphore=argument[5];
} else semaphore=0;
o=instance_create(ecks,why,o_g_typetext);
o.content=text;
o.len=string_length(o.content);
o.endpauselength=endpauselength;
o.tid=target;
o.semaphore=semaphore;
return o;
