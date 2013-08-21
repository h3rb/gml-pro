/*

 Weapons fired from the ship (the player's weapons) are echoes of the turret weapons.
 
 Adding a hardpoint turret:
 1) mount it with a weapon profile
    using mount_hardpoint,
    update it with update_hardpoints
    called right before render_hardpoints
    in Draw of the spacecra
 2) add emission points
 3) To add a burst-fire, modify generate_burst()
 
 Adding a weapon profile:
 1) Modify the code for o_weapon1 (User Event 3, User Event 0 and Create)
 2) Modify weapon_set_profile 
 3) Modify get_weapon_speed (turret related)
 The value in get_weapon_speed should be the same as the value in init_weapons global.weapon_rate 
 4) Modify get_weapon_range (turret related)
 5) Modify weapon_rate, name, sound in init_weapon, which effects player firing rate
 
  To add a hanger and bay:
 1) Add the hanger to the hanger AI.
 2) And a corresponding bay (a bay that points to the hanger's id, creating will
    set the hanger_can_launch[i] = false;
 3) Point the hanger back to the bay by setting hanger_bay[i]=bay_id;
*/
