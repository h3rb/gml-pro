/**
 * Return the firing angle
 */
var
 mount_x,mount_y,   // Mount (Hardpoint) position relative to firing object
 turnspeed,         // Speed at which angle updates (deg)
 emit_x,emit_y,     // Tip of the muzzle where the projectile emits
 mvx,mvy,           // Velocity of the firing object
 target_x,target_y, // Target's position
 tvx,tvy,           // Target's velocity
 projectile_speed,  // Speed of the gun's projectile
 current_angle,     // Gun's current firing angle (deg).
 target_range;

mount_x=argument0;
mount_y=argument1;
turnspeed=argument2;
emit_x=argument3;
emit_y=argument4;
mvx=argument5;
mvy=argument6;
target_x=argument7;
target_y=argument8;
tvx=argument9;
tvy=argument10;
projectile_speed=argument11;
target_range=argument12;

// If turning speed is infinite and it's an instanteous shot (beam)
// return the angle of the line between gun and target
//if ( turnspeed == 0.0 and projectile_speed == 0.0 ) {
 return norm_deg(radtodeg(LineAngle(mount_x,mount_y,target_x,target_y)));
//}

/*
   Triangle one:
   
                  (projected)
    HP x,y <-------- C --------> TNext x,y
             . a            c.
               .      .    .
        (range) A.       .B (moved)
                   . b .
                     T x,y
*/

// Otherwise, calculate the angle that the bullet will hit the target,
// if turnspeed is not an issue (but projectile speed is a factor).
var base_ptime,tnx,tny,moved,projected,angle_A,turntime,timeest;
base_ptime=target_range/projectile_speed;
tnx=target_x+tvx*base_ptime;
tny=target_y+tvy*base_ptime;
//moved=dist2d(target_x,target_y,tnx,tny);
//projected=dist2d(mount_x,mount_y,tnx,tny);
angle_A=radtodeg(LineAngle(mount_x,mount_y,tnx,tny));
if ( turnspeed == 0.0 ) return norm_deg(angle_A); // Precise

// Otherwise, make an 'informed guess' at best target position.
// For some guns, the gun cannot turn to fire fast enough,
// in that case this algorithm will fail.  Such guns are really
// mine layers.
turntime=angle_A/turnspeed;
timeest=base_ptime+1.5*turntime;

tnex=target_x+tvx*timeest;
tney=target_y+tvy*timeest;

return norm_deg(radtodeg(LineAngle(mount_x,mount_y,tnex,tney)));

//moved=dist2d(target_x,target_y,tnex,tney);
//projected=dist2d(mount_x,mount_y,tnex,tney);


//return norm_deg(angle_A); // Guestimate

