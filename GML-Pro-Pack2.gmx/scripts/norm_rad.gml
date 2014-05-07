var angle;
angle = argument0;
while ( angle < 0.0 ) angle=angle+2*pi;
while ( angle > 2*pi ) angle-=2*pi;
return angle;
