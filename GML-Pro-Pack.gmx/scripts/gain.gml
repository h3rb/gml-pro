var a,b;
a=argument0;
b=argument1;
if (a < 0.001)return 0;
else if (a > 0.999) return 1.0;
p = log2(1.0 - b) / log2(0.5);
if (a < 0.5) return (power(2.0 * a, p) / 2.0);
else return 1.0 - (power(2 * (1.0 - a), p) / 2.0);
