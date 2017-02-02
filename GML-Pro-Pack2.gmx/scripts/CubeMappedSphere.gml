var
 a,b,c,Fr,Do,Le,Ri,Up,Ba,pos,unit,unit2,deltaunit,r,resolution,
 count,rD,i,j,k,tcx,tcy,temp,pX,pY,pZ,
 tcx,tcy,xU,xV,yU,yV,tri,v1,v2,v3,norm;

r=1.0;
pos=0;
a=0;
b=0;
c=0;
unit=2.0;
unit2=1.0;
resolution=8;
deltaunit=unit/resolution;
pX[0]=0;
pY[0]=0;
pZ[0]=0;
rD=1/resolution;

  //generate points for unit sphere
  //front face
  a=-unit2;
  b=-unit2;
  for ( i=0; i<=resolution; i++ ) {
   for ( j=0; j<=resolution; j++ ) {
    pX[i,j]= a  * sqrt( abs(0.5- SQ(b)/2.0+ SQ(b)/3.0) );
    pY[i,j]= b  * sqrt( abs(0.5- SQ(a)/2.0+ SQ(a)/3.0) );
    pZ[i,j]= 1.0* sqrt( abs(1.0- SQ(a)/2.0- SQ(b)/2.0+ (SQ(a)*SQ(b))/3.0) );
    pos++;
    b+=deltaunit;
   }    
   a+=deltaunit;
  }
  Fr=pos;

  global.sphere[0]=d3d_model_create();
  d3d_model_primitive_begin(global.sphere[0],pr_trianglelist);
  k=0;  
  tcx=0.0;
  for ( i=0; i<resolution; i++ ) {
   tcy=1.0;  
   for ( j=0; j<resolution; j++ ) {
    v1=st_vec3d_set(pX[i,j],pY[i,j],pZ[i,j]);
    v2=st_vec3d_set(pX[i+1,j],pY[i+1,j],pZ[i+1,j]);
    v3=st_vec3d_set(pX[i,j+1],pY[i,j+1],pZ[i,j+1]);
    st_vec3d_get(TriNormal(v1,v2,v3));
    d3d_model_vertex_normal_color(global.sphere[0],0,0,0,global.vec_x,global.vec_y,global.vec_z,c_white,1.0);
    v1=st_vec3d_set(pX[i+1,j],pY[i+1,j],pZ[i+1,j]);
    v2=st_vec3d_set(pX[i+1,j+1],pY[i+1,j+1],pZ[i+1,j+1]);
    v3=st_vec3d_set(pX[i,j+1],pY[i,j+1],pZ[i,j+1]);
    st_vec3d_get(TriNormal(v1,v2,v3));
    d3d_model_vertex_normal_color(global.sphere[0],0,0,0,global.vec_x,global.vec_y,global.vec_z,c_white,1.0);
    tcx+=rD;
   }
   tcy-=rD;
  }
  d3d_model_primitive_end(global.sphere[0]);

