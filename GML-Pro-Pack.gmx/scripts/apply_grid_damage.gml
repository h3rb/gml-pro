var
 o,i,j,c,
 dax,day,
 minx,miny,
 maxx,maxy,
 ejected,trash,
 vec,
 gdx,gdy;
o=argument0;
i=argument1;

find_nearest_ship_point(o.id,o.hit_x[i],o.hit_y[i]);
dax=global.nearest_ship_x;
day=global.nearest_ship_y;
vec=shipfx_grid_screen_xy(
 o.x,o.y,
 o.image_angle,
 sprite_get_width(o.sprite_index)*o.image_xscale,
 sprite_get_height(o.sprite_index)*o.image_yscale,
 dax,day,
 o.damage_w,o.damage_h
);
st_vec2d_get(vec);

if ( WITHIN(dax,day,0,0,o.damage_w-1,o.damage_h-1) ) {

 if ( o.systems[o.sectiontype[dax,day]]>0 ) o.systems[o.sectiontype[dax,day]]-=1;

// Toss cargo from target
 if ( o.sectiontype[dax,day] == 0 or o.sectiontype[dax,day] == 4 ) {
  if ( o.cargo > 0 ) {
   if ( o.ejections[dax,day] <= 20 ) {
    if ( random(100) < o.hit_ejectable[i] ) {
     if ( o.ejections[dax,day] > 0 or o.ejections_total < 20 ) {
      if ( o.ejections[dax,day] <= 0 ) { o.ejections_total +=1; }
      ejected=random(10);
      o.cargo-=ejected;
      if ( o.sectiontype[dax,day] == 4 ) {
       // Generate some cargo ejections
       for ( j=0; j<ejected; j++ ) {
        c=instance_create(global.vec_x,global.vec_y,o_flying_space_cargo);
        c.delay=10+random(20);
        c.dx=o.dx+0.5-number_range(0,1);
        c.dy=o.dy+0.5-number_range(0,1);
        c.angle=2*pi-(LineAngle(0,0,dx,dy));
        request_smokepuff(global.vec_x,global.vec_y,10,0,0); 
        // stamp with ejection data
        o.ejections[dax,day]+=ejected;
       }
      }
      // Kick out some regular trash
      // Eject garbage
      trash=number_range(0,20);
      garbage=s_any(s_garbage);   //   GLImage *garbage=ship_garbage.AnyIndex(upto(12345));
      for ( j=0; j<trash; j++ ) {
       gdx=o.dx+random(1)-0.5;
       gdy=o.dy+random(1)-0.5;
       if ( random(1) > 0.5 ) {
        g=emit_expandcontractburn(global.vec_x,global.vec_y,gdx,gdy,s_garbage,s_any(s_garbage),bm_normal,color_any(),10.0,1.3,9.0,1.0);
       } else {
        g=emit_expandcontractburn(global.vec_x,global.vec_y,gdx,gdy,s_ship_junk,s_any(s_ship_junk),bm_normal,color_any(),10.0,1.3,9.0,1.0);
       }
      }
     }
    }
   }
  }
 }

// Toss crew from target
if ( o.sectiontype[dax,day] == 0 ) {
 if ( o.crew > o.mincrew and o.ejections[dax,day] <= 20 and random(100) < o.hit_ejectable[i] ) {
  if ( o.ejections[dax,day] > 0 or o.ejections_total < 20 ) {
   if ( o.ejections[dax,day] <= 0 ) { o.ejections_total +=1; }
   ejected=random(6);
   o.crew-=ejected;
   // Generate some crew ejections
   for ( j=0; j<ejected; j++ ) {
    c=instance_create(global.vec_x,global.vec_y,o_burning_crew);
    c.delay=10+random(20);
    request_smokepuff(global.vec_x,global.vec_y,10,0,0); 
    // stamp with ejection data
    o.ejections[dax,day]+=ejected;
   }
  }
 }
}

// Type one, centered on point
if ( o.hit_by[i] == o_weapon1 ) {
 if ( dax >= o.damage_w ) { dax=o.damage_w-1; }
 else if ( dax < 0 ) { dax=0; }
 if ( day >= o.damage_h ) { dax=o.damage_h-1; }
 else if ( day < 0 ) { day=0; }
 grid_do_damage(o,o.hit_by[i],dax,day,2*o.hit_dam[i],o.hit_temp[i],o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
 grid_do_damage(o,o.hit_by[i],dax+1,day,o.hit_dam[i],o.hit_temp[i],o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
 grid_do_damage(o,o.hit_by[i],dax-1,day,o.hit_dam[i],o.hit_temp[i],o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
 grid_do_damage(o,o.hit_by[i],dax,day+1,o.hit_dam[i],o.hit_temp[i],o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
 grid_do_damage(o,o.hit_by[i],dax,day-1,o.hit_dam[i],o.hit_temp[i],o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
 grid_do_damage(o,o.hit_by[i],dax+1,day+1,o.hit_dam[i]/2,o.hit_temp[i]/2,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
 grid_do_damage(o,o.hit_by[i],dax-1,day-1,o.hit_dam[i]/2,o.hit_temp[i]/2,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
 grid_do_damage(o,o.hit_by[i],dax-1,day+1,o.hit_dam[i]/2,o.hit_temp[i]/2,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
 grid_do_damage(o,o.hit_by[i],dax+1,day-1,o.hit_dam[i]/2,o.hit_temp[i]/2,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
 if ( o.damage[dax,day] <= 0.2 ) { 
  // Damage is more concussive due to weakened structure
  grid_do_damage(o,o.hit_by[i],dax-2,day-1,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]); // left
  grid_do_damage(o,o.hit_by[i],dax-2,day,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-2,day+1,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+2,day-1,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]); // right
  grid_do_damage(o,o.hit_by[i],dax+2,day,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+2,day+1,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-1,day-2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]); // top
  grid_do_damage(o,o.hit_by[i],dax,  day-2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+1,day-2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-1,day+2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]); // bottom
  grid_do_damage(o,o.hit_by[i],dax,  day+2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+1,day+2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);

  // And even more
  grid_do_damage(o,o.hit_by[i],dax,day-3,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax,day+3,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-3,day,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+3,day,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-2,day-2,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-2,day+2,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+2,day-2,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+2,day+2,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  
  // And even more
  grid_do_damage(o,o.hit_by[i],dax-1,day-3,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-1,day+3,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+1,day-3,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+1,day+3,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-3,day-1,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-3,day+1,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+3,day-1,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+3,day+1,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  
  // And even more!
  grid_do_damage(o,o.hit_by[i],dax-1,day+4,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax,  day+4,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+1,day+4,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-1,day-4,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax,  day-4,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+1,day-4,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-4,day+1,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-4,day  ,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-4,day+1,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+4,day+1,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+4,day  ,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+4,day+1,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);

  grid_do_damage(o,o.hit_by[i],dax+2,day-3,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+2,day+3,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+3,day-2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+3,day+2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-2,day-3,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-2,day+3,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-3,day-2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-3,day+2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
 } else
 if ( o.damage[dax,day] < 0.4 ) {
  grid_do_damage(o,o.hit_by[i],dax-2,day-1,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]); // left
  grid_do_damage(o,o.hit_by[i],dax-2,day,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-2,day+1,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+2,day-1,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]); // right
  grid_do_damage(o,o.hit_by[i],dax+2,day,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+2,day+1,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-1,day-2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]); // top
  grid_do_damage(o,o.hit_by[i],dax,  day-2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+1,day-2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-1,day+2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]); // bottom
  grid_do_damage(o,o.hit_by[i],dax,  day+2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+1,day+2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);

  // And even more
  grid_do_damage(o,o.hit_by[i],dax,day-3,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax,day+3,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-3,day,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+3,day,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-2,day-2,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-2,day+2,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+2,day-2,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+2,day+2,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  
  // And even more
  grid_do_damage(o,o.hit_by[i],dax-1,day-3,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-1,day+3,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+1,day-3,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+1,day+3,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-3,day-1,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-3,day+1,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+3,day-1,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+3,day+1,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
 } else
 if ( o.damage[dax,day] < 0.6 ) {
  grid_do_damage(o,o.hit_by[i],dax-2,day-1,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]); // left
  grid_do_damage(o,o.hit_by[i],dax-2,day,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-2,day+1,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+2,day-1,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]); // right
  grid_do_damage(o,o.hit_by[i],dax+2,day,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+2,day+1,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-1,day-2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]); // top
  grid_do_damage(o,o.hit_by[i],dax,  day-2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+1,day-2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-1,day+2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]); // bottom
  grid_do_damage(o,o.hit_by[i],dax,  day+2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+1,day+2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  // And even more
  grid_do_damage(o,o.hit_by[i],dax,day-3,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax,day+3,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-3,day,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+3,day,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-2,day-2,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-2,day+2,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+2,day-2,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+2,day+2,o.hit_dam[i]/5,o.hit_temp[i]/5,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
 } else
 if ( o.damage[dax,day] < 0.9 ) {
  grid_do_damage(o,o.hit_by[i],dax-2,day-1,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]); // left
  grid_do_damage(o,o.hit_by[i],dax-2,day,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-2,day+1,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+2,day-1,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]); // right
  grid_do_damage(o,o.hit_by[i],dax+2,day,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+2,day+1,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-1,day-2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]); // top
  grid_do_damage(o,o.hit_by[i],dax,  day-2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+1,day-2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax-1,day+2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]); // bottom
  grid_do_damage(o,o.hit_by[i],dax,  day+2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
  grid_do_damage(o,o.hit_by[i],dax+1,day+2,o.hit_dam[i]/4,o.hit_temp[i]/4,o.hit_acid[i],o.hit_electric[i],o.hit_rad[i]);
 }
}

}

