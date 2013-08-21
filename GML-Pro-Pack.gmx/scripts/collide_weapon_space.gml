var o;
o=argument0;

// Collision tests and reprocussions of collision

// Repeat for each object type, establishing collision priority, first collision stored, or noone.
o.colliding=noone;
o.collided=noone;
collide_weapon_circle(o,o_ai_drifter);
collide_weapon_circle(o,o_ai_starliner);
collide_weapon_circle(o,o_ai_gunplatform);
collide_weapon_circle(o,o_flying_space_cargo);
collide_weapon_circle(o,o_ai_asteroid);
collide_weapon_circle(o,o_ai_thilon_prong);
collide_weapon_circle(o,o_ai_durak_spaceliner);
collide_weapon_circle(o,o_ai_durak_freighter);
collide_weapon_circle(o,o_ai_durak_destroyer);
collide_weapon_circle(o,o_ai_durak_bomber);
collide_weapon_circle(o,o_ai_durak_infiltrator);
collide_weapon_circle(o,o_ai_durak_multipurpose);
collide_weapon_circle(o,o_ai_durak_cruiser);
collide_weapon_circle(o,o_ai_allindorna_cruiser);
collide_weapon_circle(o,o_ai_menaling_tug);
collide_weapon_circle(o,o_ai_kratek_cruiser);
collide_weapon_circle(o,o_ai_chronodila_cruiser);
collide_weapon_circle(o,o_ai_phenokti_cruiser);
collide_weapon_circle(o,o_ai_military_skiff);
collide_weapon_circle(o,o_ai_starliner);
collide_weapon_circle(o,o_ai_starliner_lifeboat);
collide_weapon_circle(o,o_ai_starliner_rearpod);
collide_weapon_circle(o,o_ai_pilexu_individual);
collide_weapon_circle(o,o_ai_pilexu_grouped);
collide_weapon_circle(o,o_ai_pilexu_mass);
collide_weapon_circle(o,o_ai_thilon_prong);
collide_weapon_circle(o,o_ai_remnant_cruiser);
collide_weapon_circle(o,o_ai_ursae_organaut);
collide_weapon_circle(o,o_ai_valspectre_cruiser);
collide_weapon_circle(o,o_ai_claw_cruiser);
collide_weapon_circle(o,o_ai_claw_cruiser2);
collide_weapon_circle(o,o_ai_claw_destroyer);
collide_weapon_circle(o,o_ai_claw_intercepter);
collide_weapon_circle(o,o_ai_pirate1);
collide_weapon_circle(o,o_ai_pirate2);
collide_weapon_circle(o,o_ai_pirate3);
collide_weapon_circle(o,o_ai_pirate4);
collide_weapon_circle(o,o_player);

if ( o.colliding != noone ) {
 if ( o.collided != noone ) {
  if ( instance_exists(o.collided) ) {
/*   if ( colliding == o_ai_drifter ) {
    if ( collided.team != team and !collided.dying ) {
     store_collision(o,collided.o,damage,heat,aco,static,radiation,direction,velocity,x,y);
     g_explosion(x,y,s_energy,c_red,1.0,0.3);
     instance_destroy();
    }
   } else */
   if ( is_starship(o.colliding) or o.colliding == o_player ) {
    if ( o.collided.team != team and !o.collided.dying ) {
     store_collision(o,collided,o.damage,o.heat,o.aco,o.static,o.radiation,o.direction,o.velocity,o.x,o.y);
     g_explosion(o.x,o.y,s_energy,c_red,1.0,0.3);//
     instance_destroy();
    }
   } else if ( colliding == o_flying_space_cargo ) {
    g_explosion(x,y,s_energy,c_red,1.0,0.3);//
    instance_destroy();
   } else if ( colliding == o_ai_gunplatform ) {
    if ( o.collided.team != o.team and !o.collided.dying ) {
     store_collision(o,o.collided,o.damage,o.heat,o.aco,o.static,o.radiation,o.direction,o.velocity,o.x,o.y);
     g_explosion(x,y,s_energy,c_red,1.0,0.3);//
     instance_destroy();
    }
   } else if ( o.colliding == o_ai_asteroid ) {
    if ( !o.collided.dying ) {
     o.collided.collided=collided;
     o.collided.damage = damage;
     o.collided.heating = heat; 
     o.collided.collided_x=x;
     o.collided.collided_y=y;
     with ( o.collided ) { event_user(10); }
     if ( o.collided.impacted) {
      g_explosion(x,y,s_energy,c_red,1.0,0.3);
      instance_destroy();
     }
    }
   }
  }
 }
}
