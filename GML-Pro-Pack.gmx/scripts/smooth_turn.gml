return (argument5+median(-argument2,argument2*(radtodeg(sin(degtorad(argument0- (argument1+argument5))))-(sqr(argument5)/(2*(argument2*(argument2+argument3)))*sign(argument5))),argument2)*sign(max(0,argument4-abs(argument5))));

/*
THIS IS THE UN-OPTIMIZED VERSION THATS EASIER TO READ AND EDIT

//turn_towards(targetdir,dir,turninc,turnfric,turnmax,turnspeed)
//returns the updated turnspeed
var targetdir,currentdir,turninc,turnfric,turnmax,turnspeed,a,d;
targetdir=argument0
currentdir=argument1
turninc=max(0,argument2)
turnfric=median(0,argument3,1)
turnmax=max(0,argument4)
turnspeed=argument5

a=radtodeg(sin(degtorad(targetdir - (currentdir+turnspeed))))
d=(sqr(turnspeed)/(2*(turninc*(turninc+turnfric)))*sign(turnspeed))

if abs(turnspeed)<turnmax
{
turnspeed+=median(-turninc,turninc*(a-d),turninc)
}
return (turnspeed);
