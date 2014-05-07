var ttid,addtype,ecks,why,t,bwidth,semaphore,i;
ttid=argument0;
addtype=argument1; // 0=button, 1=textanim ...
ecks=argument2;
why=argument3;
t=argument4; // label or text
bwidth=argument5; // for button = width, for textanim = speed
target=argument6;
semaphore=argument7;
i=ttid.listed;
ttid.list[i]=addtype;
ttid.bwidth[i]=bwidth;
ttid.xs[i]=ecks;
ttid.ys[i]=why;
ttid.data[i]=t;
ttid.go[i]=target;
ttid.semaphores[i]=semaphore;
ttid.listed+=1;
