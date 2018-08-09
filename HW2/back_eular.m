function [cur] = back_eular(a,b,h,y0)
    error = 1e-6;
    steps = [];
    cur = [];
    x0 = a;
    steps = [steps 0];
    cur = [cur y0];
    
    for k = a+h:h:b
        yt = y0 + h * func3(x0,y0);
        x1 = k;
        for t = 1:10
            y1 = y0 + h * func3(x1,yt);
            err = abs(y1 - yt);
            if err <= error
                break;
            end
            yt = y1;
        end
        steps = [steps k];
        cur = [cur y1];
        y0 = y1;
        x0 = k;
    end
    plot(steps,cur,'green');
    display(cur);
end

