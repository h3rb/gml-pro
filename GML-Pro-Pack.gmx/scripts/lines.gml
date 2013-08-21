var in;
in = argument0;
return
 string_count("#",in)
-string_count("/#",in)
+char_count(in,13)
+char_count(in,10);
