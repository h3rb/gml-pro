var month,out;
month=argument0;
out="";
if ( month==1  ) return "Alpha";
if ( month==2  ) return "Beta";
if ( month==3  ) return "Gamma";
if ( month==4  ) return "Delta";
if ( month==5  ) return "Epsilon";
if ( month==6  ) return "Zeta";
if ( month==7  ) return "Eta";
if ( month==8  ) return "Theta";
if ( month==9  ) return "Iota";
if ( month==10 ) return "Kappa";
if ( month==11 ) return "Lambda";
if ( month==12 ) return "Mu";

/* not this way:
switch(month) {
 default: get_string(float(month),""); break;
 case  1: out="Alpha"; break;
 case  2: out="Beta"; break;
 case  3: out="Gamma"; break;
 case  4: out="Delta"; break;
 case  5: out="Epsilon"; break;
 case  6: out="Zeta"; break;
 case  7: out="Eta"; break;
 case  8: out="Theta"; break;
 case  9: out="Iota"; break;
 case 10: out="Kappa"; break;
 case 11: out="Lambda"; break;
 case 12: out="Mu"; break;
}
return out;
*/

/* not this way:
if ( month=="January" ) return "Alpha";
if ( month=="February" ) return "Beta";
if ( month=="March" ) return "Gamma";
if ( month=="April" ) return "Delta";
if ( month=="May" ) return "Epsilon";
if ( month=="June" ) return "Zeta";
if ( month=="July" ) return "Eta";
if ( month=="August" ) return "Theta";
if ( month=="September" ) return "Iota";
if ( month=="October" ) return "Kappa";
if ( month=="Novemeber" ) return "Lambda";
if ( month=="December" ) return "Mu";
*/

