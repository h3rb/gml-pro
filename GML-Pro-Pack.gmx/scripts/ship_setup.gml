var o;
o=argument[0];

if ( argument_count <= 3 ) o.name="Space Ship";
else o.name=argument[3];

o.uid=new_uid(object_index);
o.dying=false;
o.turnSpeed=0.1;
o.sprite=argument[1];
o.spritesub=argument[2];
o.shipfx_instant=0;

if ( argument_count <= 4 ) o.scale=1.0;
else o.scale=argument[4];

o.screenw=sprite_get_width(sprite)*scale;
o.screenh=sprite_get_height(sprite)*scale;
o.direction=number_range(0,360);
o.alpha=1.0;
o.color=c_white;

o.velocity=0;
o.maxvelocity=4;
o.deltavelocity=0.0;
o.accel=0.01;
o.decel=0.05;
o.turning=0.0;

// Set when you change the scale
o.image_xscale=o.scale;
o.image_yscale=o.scale;

o.hardpoints=0;
o.lights=0;
o.cargo=0;
o.cargo_capacity=0;
o.crew_capacity=800;
o.mincrew=10;
o.crew=5;

o.closest_enemy=noone;
o.next_closest_enemy=noone;
o.next_next_closest_enemy=noone;
