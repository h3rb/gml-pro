var datetime;
datetime=argument0;
if ( time_is_am(datetime) ) return date_get_hour(datetime);
else return date_get_hour(datetime)-12;
