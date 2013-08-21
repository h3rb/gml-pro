var iid,temp,count,j,m;
iid=argument0;
count=0;
j=0;
m=global.shipfx_manager;
// Remove all occurances of iid from list
// Make a copy, filtering
for ( i=0; i<m.managing; i++ ) {
 if ( m.managed[i] == iid ) {
 } else {
  new_managed[j]=m.managed[i];
  count++;
  j++;
 }
}
// Copy it back over the original
for ( j=0; j<count; j++ ) m.managed[j]=new_managed[j];
m.managing=count;

