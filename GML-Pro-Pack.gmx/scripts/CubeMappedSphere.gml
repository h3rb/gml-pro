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

  /*
  c=unit2;
  b=-unit2;
  for ( i=0; i<=resolution; i++ ) {
   for ( j=0; j<=resolution; j++ ) {
    pX[pos]= 1.0* sqrt( 1.0- SQ(b)/2.0- SQ(c)/2.0+ (SQ(b)*SQ(c))/3.0);
    pY[pos]= b * sqrt( 0.5- SQ(c)/2.0+ SQ(c)/3.0);
    pZ[pos]= c * sqrt( 0.5- SQ(b)/2.0+ SQ(b)/3.0);
    pos++;
    b+=deltaunit;
   }
   c-=deltaunit;
  }
  Le=pos; 
 
   //back face
  a=unit2;
  b=-unit2;
  for ( i=0; i<=resolution; i++ ) {
   for ( j=0; j<=resolution; j++ ) {
    pX[pos]= a * sqrt( 0.5 - SQ(b)/2.0+ SQ(b)/3.0);
    pY[pos]= b * sqrt( 0.5 - SQ(a)/2.0+ SQ(a)/3.0);
    pZ[pos]= -1.0 * sqrt( 1.0 - SQ(a)/2.0- SQ(b)/2.0+ (SQ(a)*SQ(b))/3.0);
    pos++;
    b+=deltaunit;
   }
   a-=deltaunit;
  }
  Ba=pos;

 //right face
  c=-unit2;
  b=-unit2;
  for ( i=0; i<=resolution; i++ ) {
   for ( j=0; j<=resolution; j++ ) {
    pX[pos]= -1.0* sqrt( 1.0 - SQ(b)/2.0- SQ(c)/2.0+ (SQ(b)*SQ(c))/3.0);
    pY[pos]= b * sqrt( 0.5 - SQ(c)/2.0 + SQ(c)/3.0);
    pZ[pos]= c * sqrt( 0.5 - SQ(b)/2.0 + SQ(b)/3.0);
    pos++;
    b+=deltaunit;
   }
   c+=deltaunit;
  }
  Ri=pos;
  
   //bottom face
  a=-unit2;
  c=-unit2;
  for ( i=0; i<=resolution; i++ ) {
   for ( j=0; j<=resolution; j++ ) {
    pX[pos]= a * sqrt( 0.5- SQ(c)/2.0+ SQ(c)/3.0);
    pY[pos]= 1.0* sqrt( 1.0- SQ(c)/2.0- SQ(a)/2.0+ (SQ(c)*SQ(a))/3.0);
    pZ[pos]= c * sqrt( 0.5- SQ(a)/2.0+ SQ(a)/3.0);
    pos++;
    c+=deltaunit;
   }
   a+=deltaunit;
  }
  Do=pos;
 
  //top face
  a=-unit2;
  c=-unit2;
  for ( i=0; i<=resolution; i++ ) {
   for ( j=0; j<=resolution; j++ ) {
    pX[pos]= a * sqrt( 0.5- SQ(c)/2.0+ SQ(c)/3.0);
    pY[pos]= -1.0* sqrt( 1.0- SQ(c)/2.0- SQ(a)/2.0+ (SQ(c)*SQ(a))/3.0);
    pZ[pos]= c * sqrt( 0.5- SQ(a)/2.0+ SQ(c)/3.0);
    pos++;
    c+=deltaunit;
   }
   a+=deltaunit;
  }
  Up=pos;

  
// Build the sphere model, one per side (6)
rD=(1/resolution);
count=0;
v1=0;
v2=resolution+1;
*/
/*
#define FRONT_ID  0
#define RIGHT_ID  1
#define BACK_ID   2
#define LEFT_ID   3
#define TOP_ID    4
#define BOTTOM_ID 5
*/
/*
//polygon generation
for (k=0; k<6; k++) {
 tri=0;
 point=0;
 tcx=0.0;
 for (j=0; j<=resolution; j++) {//per x
  tcy=1.0;
  temp=0;
  tri=0;
  point=0;
  stop=false;
  for (i=0; i<=resolution or stop; i++) {//per y     // 
   if (i==resolution) {
    v1++;
    v2++;
    stop=true;
   } else {                                     // v1+1    __  v2+1 
    count++;                                    //      |\   | 
//two triangles together per column segment     // |    | \ 2|
                                                //      |1 \ |
                                                // v1   |__ \| v2 (v2-1)
    if ( (k==4 or k==3) and j==resolution) {
     v1++;
     v2++;
    } else if ( k==5 and j==resolution) {
     v1++;
     v2++;
     stop=true;
    } else {
     if ( k == 4 ) { // bottom
      xU=tcx;
      xV=tcx+rD;
      yU=1.0-tcy;
      yV=1.0-(tcy-rD); // Y is inverted on bottom face
      // tri1
      v1++;
      sphere[k,point]=st_vec3d_set(pX[v1],pY[v1],pZ[v1]);
      sphere_tc[k,point]=st_vec2d_set(xU,yV);
      point++;
      v1--;
      sphere[k,point]=st_vec3d_set(pX[v2],pY[v2],pZ[v2]);
      sphere_tc[k,point]=st_vec2d_set(xV,yU);
      point++;
      v2++;
      sphere[k,point]=st_vec3d_set(pX[v1],pY[v1],pZ[v1]);
      sphere_tc[k,point]=st_vec2d_set(xU,yU);
      point++;
      v1++;
      sphere_normal[k,tri]=
       TriNormal(
        sphere[k,point-3],
        sphere[k,point-2],
        sphere[k,point-1]
       );
      tri++;
      // tri2
      sphere[k,point]=st_vec3d_set(pX[v2],pY[v2],pZ[v2]);
      sphere_tc[k,point]=st_vec2d_set(xV,yV);
      point++;
      sphere[k,point]=st_vec3d_set(pX[v2-1],pY[v2-1],pZ[v2-1]);
      sphere_tc[k,point]=st_vec2d_set(xV,yU);
      point++;
      sphere[k,point]=st_vec3d_set(pX[v1],pY[v1],pZ[v1]);
      sphere_tc[k,point]=st_vec2d_set(xU,yV);
      point++;
      sphere_normal[k,tri]=
       TriNormal(
        sphere[k,point-3],
        sphere[k,point-2],
        sphere[k,point-1]
       );
      tri++;
     } else { // other faces
      xU=tcx;
      xV=tcx+rD;
      yU=tcy;
      yV=tcy-rD;
      // tri1
      sphere[k,point]=st_vec3d_set(pX[v1],pY[v1],pZ[v1]);
      sphere_tc[k,point]=st_vec2d_set(xU,yU);
      point++;
      v1++;
      sphere[k,point]=st_vec3d_set(pX[v2],pY[v2],pZ[v2]);
      sphere_tc[k,point]=st_vec2d_set(xV,yU);
      point++;
      v2++; 
      sphere[k,point]=st_vec3d_set(pX[v1],pY[v1],pZ[v1]);
      sphere_tc[k,point]=st_vec2d_set(xU,yV);
      point++;
      sphere_normal[k,tri]=
       TriNormal(
        sphere[k,point-3],
        sphere[k,point-2],
        sphere[k,point-1]
       );
      tri++;
      // tri2
      sphere[k,point]=st_vec3d_set(pX[v1],pY[v1],pZ[v1]);
      sphere_tc[k,point]=st_vec2d_set(xU,yV);
      point++;
      sphere[k,point]=st_vec3d_set(pX[v2-1],pY[v2-1],pZ[v2-1]);
      sphere_tc[k,point]=st_vec2d_set(xV,yU);
      point++;
      sphere[k,point]=st_vec3d_set(pX[v2],pY[v2],pZ[v2]);
      sphere_tc[k,point]=st_vec2d_set(xV,yV);
      point++;
      sphere_normal[k,tri]=
       TriNormal(
        sphere[k,point-3],
        sphere[k,point-2],
        sphere[k,point-1]
       );
      tri++;
     }
    }
   }
   tcy-=rD;
  }//end i
  tcx+=rD;
 }//end j
 sphere_triangles[k]=tri;
 sphere_points[k]=point;
}//end k

// Generate 6 distinct GameMaker models from the sphere data

for ( k=0; k<=6; k++ ) {
 global.sphere[k]=d3d_model_create();
 d3d_model_primitive_begin(global.sphere[k],pr_trianglelist);
 for ( i=0; i<=sphere_triangles[k]; i++ ) {
  var ax,ay,az,atx,aty,
      bx,by,bz,btx,bty,
      cx,cy,cz,ctx,cty,
      nx,ny,nz;
  var t;
  st_vec3d_get(global.sphere_normal[k,i]);
  nx=global.vec_x;
  ny=global.vec_y;
  nz=global.vec_z;
  t=i*3;
  st_vec3d_get(global.sphere[k,t]);
  ax=global.vec_x;
  ay=global.vec_y;
  az=global.vec_z;
  st_vec2d_get(global.sphere_tc[k,t]);
  atx=global.vec_x;
  aty=global.vec_y;
  st_vec3d_get(global.sphere[k,t+1]);
  bx=global.vec_x;
  by=global.vec_y;
  bz=global.vec_z;
  st_vec2d_get(global.sphere_tc[k,t+1]);
  btx=global.vec_x;
  bty=global.vec_y;
  st_vec3d_get(global.sphere[k,t+2]);
  cx=global.vec_x;
  cy=global.vec_y;
  cz=global.vec_z;  
  st_vec2d_get(global.sphere_tc[k,t+2]);
  ctx=global.vec_x;
  cty=global.vec_y;
  d3d_model_vertex_normal_texture_color(
   global.sphere[k,i],
   ax,ay,az,nx,ny,nz,atx,aty,c_white,1.0
  );
  d3d_model_vertex_normal_texture_color(
   global.sphere[k,i],
   bx,by,bz,nx,ny,nz,btx,bty,c_white,1.0
  );
  d3d_model_vertex_normal_texture_color(
   global.sphere[k,i],
   cx,cy,cz,nx,ny,nz,ctx,cty,c_white,1.0
  );
 }
 d3d_model_primitive_end(global.sphere[k]);
}
*/
