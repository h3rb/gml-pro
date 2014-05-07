var ecks,why,M;
ecks=argument0;
why=argument1;
M=Magnitude2d(ecks,why);
if ( M != 0.0 ) {
 ecks=ecks/M;
 why=why/M;
 return sqrt( (ecks*ecks)+(why*why) );
} else return 0.0;
