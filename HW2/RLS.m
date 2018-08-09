function [x0] = RLS(A,b)
    %error = 1e-6;
    m = size(A,1);
    n = size(A,2);

    I = eye(n);
    P0 = 1e5 * I;
    x0 = rand(n,1);
    
    steps = [];
    conv = [];
    %testp = [P0];
    %testx = [x0];
    
    for k = 0:(m-1)
        tmp = (P0 * A(k+1,:)') / (1 + A(k+1,:) * P0 * A(k+1,:)');
        P1 = P0 - tmp * A(k+1,:) * P0;
        x1 = x0 + tmp * (b(k+1) - A(k+1,:) * x0);

        %testp = [testp P1];
        %testx = [testx x1];
        
        err = norm(x1 - x0);
        P0 = P1;
        x0 = x1;
        steps = [steps k];
        conv = [conv err];
    end
    see = 2000;
    plot(steps(1:see), conv(1:see));
    %display(testp);
    %display(testx);
end

