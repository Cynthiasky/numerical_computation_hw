a = 10;
b = 11;

res = [];
res = [res dich(a,b)];
res = [res newtown(x,a)];
res = [res simp_newtown(a)];
res = [res secant(a,b)];

display(vpa(res,10));
display(vpa(sqrt(x),10));