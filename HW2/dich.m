function [res] = dich(a,b)
    error = 1e-6;
    steps = [];
    conv = [];
    time = [];
    tic;
    for k = 1:50
        mid = (a + b) / 2;
        if func(mid) == 0
            break;
        end
        
        if func(a) * func(mid) > 0
            a = mid;
        else
            b = mid;
        end
        err = abs(a - b);
        if err <= error
            res = mid;
            break;
        end
        time = [time toc];
        conv = [conv err];
        steps = [steps k];
        % tic;
    end
    % plot(steps, conv);
    % plot(time, conv);
end

