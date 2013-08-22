<?php

 if ( isset($_GET['ip']) ) {
  echo $_SERVER['REMOTE_ADDR'];
  die;
 }

 global $ipfile;
 $ipfile="ips.txt";

 if ( isset($_GET['announce']) ) {
  if ( isset($_GET['port']) ) {
   if ( isset($_GET['x']) ) {
    if ( isset($_GET['y']) ) {
     $announced=urldecode($_GET['announce']);
    }
   }
  } else $announced="0";
 } else $announced="";

 update_ips($announced,$_GET['port']);

 function update_ips( $announced, $port ) {
  $i=get_ips();
  if ( strlen($announced) > 0 ) {
   if ( $announced == "0" ) {
    print("PORT?");die;
   } else {
    if ( ( $t= no_duplicates($_SERVER['REMOTE_ADDR'],$i) ) == -1 ) {
     $t=count($i);
     $i[$t][0]=$announced;
     $i[$t][1]=$port;
     $i[$t][2]=$_SERVER['REMOTE_ADDR'];
     $i[$t][3]=date('m/d/Y H:i:s');
     $i[$t][4]=$_GET['x'];
     $i[$t][5]=$_GET['y'];
    } else {
     $i[$t][0]=$announced;
     $i[$t][1]=$port;
     $i[$t][2]=$_SERVER['REMOTE_ADDR'];
     $i[$t][3]=date('m/d/Y H:i:s');
     $i[$t][4]=$_GET['x'];
     $i[$t][5]=$_GET['y'];
    }
   }
  }
  $i=sort_ip_by_xydist($i,$_GET['x'],$_GET['y']);
  echo save_ips($i);
 }

 function no_duplicates($needle,$stack) {
  $c=0;
  foreach ( $stack as $i ) {
   if ( $i[2] == $needle ) return $c;
   $c++;
  }
  return -1;
 }

 function cmp_sort($a,$b) {
  $ta=strtotime($a[3]);
  $tb=strtotime($b[3]);
  if ( $ta == $tb ) return 0;
  if ( $ta > $tb ) return -1; // sort descending
  return 1;
 }

 function get_ips() {
  global $ipfile;
  $raw=file_get_contents($ipfile);
  $arr=explode("\n",$raw);
  $res=array();
  $i=0;
  foreach ( $arr as $ip ) {
   $b=explode("|",$ip);
   if ( strlen($b[0]) > 0 ) {
    if ( strlen($b[1]) > 0 ) {
     if ( strlen($b[2]) > 0 ) {
      if ( strlen($b[3]) > 0 ) {
       if ( strlen($b[4]) > 0 ) {
        if ( strlen($b[5]) > 0 ) {
         $res[$i][0]=$b[0];
         $res[$i][1]=$b[1];
         $res[$i][2]=$b[2];
         $res[$i][3]=$b[3];
         $res[$i][4]=$b[4];
         $res[$i][5]=$b[5];
         $i++;
        }
       }
      }
     }
    }
   }
  }
  usort($res, "cmp_sort" );
  return $res;
 }

 function dist($x1,$y1,$x2,$y) {
  return sqrt( ($x1 - $x2) * ($x1 - $x2) + ($y1 - $y2) * ($y1 - $y2) );
 }

 function cmp_distsort( $a, $b ) {
  if ( $a[6] > $b[6] ) return 1;
  else if ( $a[6] == $b[6] ) return 0;
  else return -1;
 }

 function sort_ip_by_xydist( $i, $x, $y ) {
  foreach ( $i as &$j ) {
   $j[6]=dist($x,$y,$j[4],$j[5]);
  }
  usort($i, "cmp_distsort" );
  return $i;
 }

 function save_ips($ips) {
  global $ipfile;
  $out="";
  $echoed="";
  $i=32; // useful client connection limit
  foreach ( $ips as $ip ) if ( time() - strtotime($ip[3]) < 60*5 ) {
   $out.=$ip[0]."|".$ip[1]."|".$ip[2]."|".$ip[3]."|".$ip[4]."|".$ip[5]."\n";
   if ( $i < 0 ) break;
   $echoed.=$ip[0]."|".$ip[1]."|".$ip[2]."|".$ip[3]."|".$ip[4]."|".$ip[5]."\n";
   $i--;
  }
  file_put_contents($ipfile,$out);
  return $echoed;
 }
