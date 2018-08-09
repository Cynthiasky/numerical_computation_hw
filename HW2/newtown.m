function [res] = newtown(x,x0)
    error = 1e-6;
    steps = [];
    conv = [];
    time = [];
    tic;
    for k = 1:50
        x1 = 0.5 * (x0 + x / x0);
        err = abs(x1 - x0) / abs(x1);
        if err <= error
            res = x1;
            break;
        end;
        x0 = x1;
        time = [time toc];
        % steps = [steps k];
        conv = [conv err];
    end
    %plot(time,conv);
    %plot(steps,conv);
end

