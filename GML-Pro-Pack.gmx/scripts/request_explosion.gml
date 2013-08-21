var ecks,why,explosion,q;
ecks=argument[0];
why=argument[1];
explosion=argument[2];
if ( argument_count > 3 ) {
 vx=argument[3];
 vy=argument[4];
} else {
 vx=0;
 vy=0;
}

q=global.explosion_manager.queue;
global.explosion_manager.explosion[q]=explosion;
global.explosion_manager.count[q]=1;
global.explosion_manager.duration[q]=0;
global.explosion_manager.interval[q]=0;
global.explosion_manager.timer[q]=0;
global.explosion_manager.xs[q]=ecks;
global.explosion_manager.ys[q]=why;
global.explosion_manager.vx[q]=vx;
global.explosion_manager.vy[q]=vy;
global.explosion_manager.ofs[q]=0;
global.explosion_manager.creep[q]=0;
global.explosion_manager.queue++;
