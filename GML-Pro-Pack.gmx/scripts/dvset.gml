var total,data,i;
total=split(global.table_data[global.datavec[0],global.datavec[1]]);
data="";
if ( total < global.datavec[2] ) {
 for ( i=0; i<total; i++ ) {
  data+=global.script_array1[i]+global.d; // note the adding of the delim in split() is a baaad feature
 }
 while ( i<global.datavec[2] ) {
  data+=global.d;
  i++;
 }
 data+=argument0+global.d;
} else {
 for ( i=0; i<total; i++ ) {
  if ( i == global.datavec[2] ) data+=argument0+global.d;
  else data+=global.script_array1[i]+global.d; // note the adding of the delim in split() is a baaad feature
 }
}
global.table_data[global.datavec[0],global.datavec[1]]=data;
//get_string(int(global.datavec[0])+","+int(global.datavec[1])+","+int(global.datavec[2])+" was set to",data);
