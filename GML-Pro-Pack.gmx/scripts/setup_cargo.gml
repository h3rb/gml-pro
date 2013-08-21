var o;
o=argument[0]; // target instance

o.cargo_contents[0]="";
o.cargo_type[0]=-1; // Can distinguish between 0=compound, 1=element, 2=item and 3=artifact

var generate;
generate=true;
if ( argument_count == 2 ) {
 if ( argument[1] == false ) generate=false;
}

if ( generate ) {
 // Generate custom cargo contents based on current capacity
 var i;
 for ( i=0; i<o.cargo; i++ ) {
  if ( is_starship(o.object_index) ) {
   o.cargo_contents[i]=int(random_compound());
   o.cargo_type[i]=0; // 0=compound
  } else if ( is_starbase(o.object_index) ) {
   o.cargo_contents[i]=int(random_element());
   o.cargo_type[i]=1; // 1=element
  }
 }
}
