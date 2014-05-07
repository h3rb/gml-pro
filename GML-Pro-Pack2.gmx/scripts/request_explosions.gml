var ecks,why,explosion,spread,count,duration,interval,creep,q;
ecks=argument[0];
why=argument[1];
explosion=argument[2];
spread=argument[3];
count=argument[4];
duration=argument[5];
interval=argument[6];
creep=argument[7];
if ( argument_count > 8 ) {
 vx=argument[8];
 vy=argument[9];
} else {
 vx=0;
 vy=0;
}

q=global.explosion_manager.queue;
global.explosion_manager.explosion[q]=explosion;
global.explosion_manager.count[q]=count;
global.explosion_manager.duration[q]=duration;
global.explosion_manager.interval[q]=interval;
global.explosion_manager.timer[q]=0;
global.explosion_manager.xs[q]=ecks;
global.explosion_manager.ys[q]=why;
global.explosion_manager.vx[q]=vx;
global.explosion_manager.vy[q]=vy;
global.explosion_manager.spread[q]=spread;
global.explosion_manager.creep[q]=creep;
global.explosion_manager.queue+=1;
