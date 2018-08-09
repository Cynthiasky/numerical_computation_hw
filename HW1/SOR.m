function [x] = SOR(A, b, w)
n = size(A, 1);
x = zeros(n,1);
newx = zeros(n,1);
error = 1e-5;
maxerror = 1e+2;
steps = [];
v = [];

for k=1:200
    for i = 1:n
        sum1 = 0;
        for j = 1:(i-1)
            sum1 = sum1 + A(i,j) * newx(j);
        end
        
        sum2 = 0;
        for j = i:n
            sum2 = sum2 + A(i,j) * x(j);
        end
        newx(i) = x(i) + w * (b(i) - sum1 - sum2) / A(i,i);
    end
    e = norm((newx-x),Inf);
    x = newx;
    v = [v e];
    steps = [steps k];
    
    if e <= error
        break;
    end    
    if e >= maxerror
        break;
    end
end

% plot(steps,v);
% txt = ['\downarrow w = ', num2str(w)];
% text(steps(length(steps)),v(1),txt);
% xlabel('steps');
% ylabel('relative error');
% title('converge cure');
end

