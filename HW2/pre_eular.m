function [cur] = pre_eular(a,b,h,y0)
    steps = [];
    cur = [];
    x0 = a;
    steps = [steps 0];
    cur = [cur y0];
    
    for k = a+h:h:b
        y1 = y0 + h * func3(x0,y0);
        steps = [steps k];
        cur = [cur y1];
        y0 = y1;
        x0 = k;
    end
    plot(steps,cur,'yellow');
    display(steps);
    display(cur);
end

