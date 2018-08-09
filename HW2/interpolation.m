f1 = [0.32 0.314567];
f2 = [0.34 0.333487];
f3 = [0.36 0.352274];
f4 = [0.38 0.370920];
x = 0.35;

res = [];

res = [res linear_inter(f2,f3,x)];
res = [res quad_inter(f1,f2,f3,x)];
res = [res tr_inter(f1,f2,f3,f4,x)];

display(vpa(res,7));
display(vpa(sin(x),7));