a = 0;
b = 1;
h = 0.1;
y0 = 1;

real = [];
steps = [];
for k = a:h:b
    real = [real sqrt(1+2*k)];
    steps = [steps k];
end

plot(steps,real,'red');
hold on;

pre_eular(a,b,h,y0);
back_eular(a,b,h,y0);
trapezoid2(a,b,h,y0);
improve_eular(a,b,h,y0);