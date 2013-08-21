var o,dax,day,dam,heatcold,acid,electrical,radiation;
o=argument0;
oi=argument1;
dax=argument2;
day=argument3;
dam=argument4;
heatcold=argument5;
acid=argument6;
electrical=argument7;
radiation=argument8;

if ( not WITHIN(dax,day,0,0,o.damage_w-1,o.damage_h-1) ) return false;
if ( o.damage[dax,day] == -666 ) return false; // also checks heatcold (which uses the same marker)
o.damage[dax,day]-=dam;
o.heatcold[dax,day]+=heatcold;
o.acid[dax,day]+=acid;
o.acidized[dax,day]+=acid;
o.static[dax,day]+=electrical;
o.electrified[dax,day]+=electrical;
o.radiation[dax,day]+=radiation;
o.irradiated[dax,day]+=radiation;
o.totalrads+=radiation;
if ( o.heatcold[dax,day] < -273 ) o.heatcold[dax,day]=-273;
else if ( o.heatcold[dax,day] > 273 ) o.headcold[dax,day]=273;
if ( o.damage[dax,day] < 0 ) o.damage[dax,day]=0;
 if ( o.heatcold[dax,day] > 60 or o.heatcold[dax,day] < -60 ) {
  o.melted[dax,day]+=1;
  if ( o.melted[dax,day] <= 1 ) {
   if ( (dax+day)%3 == 0 )o.melted_sprite[dax,day]=s_pocks1;
   else                   o.melted_sprite[dax,day]=s_pocks2;
   o.melted_num[dax,day]=(o.melted[dax,day]+dax+day)%sprite_get_number(o.melted_sprite[dax,day]);
  }
 }
return true;
