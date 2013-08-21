var ecks,why,dx,dy,sprite,blend,tint,duration,in,out,o,scale;
ecks=argument0;
why=argument1;
dx=argument2;
dy=argument3;
sprite=argument4;
sub=argument5;
blend=argument6;
tint=argument7;
duration=argument8;
in=argument9;
out=argument10;
scale=argument11;

o=instance_create(ecks,why,FAF_ExpandContractBurn);
o.duration=duration;
o.in=in;
o.out=out;
o.dx=dx;
o.dy=dy;
o.spin=number_range(0,5);
o.sub=sub;
o.sprite=sprite;
o.blend=blend;
o.tint=tint;
o.scale=scale;
o.team=9999;
return o;

 
