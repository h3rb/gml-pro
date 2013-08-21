var bullet,target,damage,angle,velocity,ecks,why,i;
bullet=argument0;
target=argument1;
damage=argument2;
heat=argument3;
acid=argument4;
electrical=argument5;
radiation=argument6;
angle=argument7;
velocity=argument8;
ecks=argument9;
why=argument10;

if ( instance_exists(bullet) ) {
 i=target.hit;
 target.hit_x[i]=ecks;
 target.hit_y[i]=why;
 target.hit_spd[i]=velocity;
 target.hit_dam[i]=damage;
 target.hit_temp[i]=heat;
 target.hit_acid[i]=acid;
 target.hit_electric[i]=electrical;
 target.hit_rad[i]=radiation;
 target.hit_by[i]=bullet.object_index;
 target.hit_ejectable[i]=bullet.ejectable;
 target.hit_instance[i]=bullet;
 target.hit+=1;
}

