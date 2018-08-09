function [res] = secant(x0,x1)
    error = 1e-6;
    steps = [];
    conv = [];
    time = [];
    tic;
    for k = 1:50
        div = (func(x1) - func(x0)) / (x1 - x0);
        x2 = x1 - func(x1) / div;
        err = abs(x2 - x1);
        
        if err <= error
            res = x2;
            break;
        end;
        x0 = x1;
        x1 = x2;
        time = [time toc];
      % steps = [steps k];
        conv = [conv err];
    end
   % plot(time,conv);
   % plot(steps,conv);

end