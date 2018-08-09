function [x] = jacobi(A, b)
n = size(A, 1);
x = zeros(n,1);
error = 1e-5;
maxerror = 1e+2;
newx = zeros(n,1);
steps = [];
v = [];

for k = 1:200
    for i = 1:n
        tmp = 0;
        for j = 1:n
            if(j == i)
                continue;
            end
            tmp = tmp + A(i,j) * x(j);
        end
        newx(i) = (b(i) - tmp) / A(i,i);
    end
    e = norm(newx-x);
    if e <= error
        break;
    end
    if e >= maxerror
        break;
    end
    x = newx;
    v = [v e];
    steps = [steps k];
end

% plot(steps,v);
% xlabel('steps');
% ylabel('relative error');
% title('converge cure');
end

