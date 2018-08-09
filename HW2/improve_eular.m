function [cur] = improve_eular(a,b,h,y0)
    steps = [];
    cur = [];
    x0 = a;
    steps = [steps 0];
    cur = [cur y0];
    
    for k = a+h:h:b
        yt = y0 + h * func3(x0,y0);
        x1 = k;
        y1 = y0 + h/2 * (func3(x1,yt) + func3(x0,y0));
        
        steps = [steps k];
        cur = [cur y1];
        y0 = y1;
        x0 = k;
    end
    plot(steps,cur,'black');
    display(cur);
end

