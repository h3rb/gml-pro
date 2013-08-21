var datetime,twelve;
datetime=argument0;
twelve=date_inc_hour(datetime,12);
if ( date_get_day_of_year(twelve) == date_get_day_of_year(datetime) ) return true;
return false;
