N = [5 9 17 33];
a = 0;
b = 1;

res1 = [];
res2 = [];

fun = @(x) sin(x)./x;
real = integral(fun,0,1);

for i = 1:4
    res1 = [res1 trapezoid(a,b,N(i))];
    res2 = [res2 simpson(a,b,N(i))];
end

display(vpa(res1,10));
display(vpa(res2,10));
display(vpa(real,10));