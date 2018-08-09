% Gaussian
function[x] = Gaussian(A,b)
n = size(A,1);
M = [A b];

for i = 1:(n-1)
    for k = (i+1):n
        m = M(k,i) / M(i,i);
        M(k,:) = M(k,:) + M(i,:) .* (-m);
    end
    % disp(M); % for testing
end

% back
x = zeros(n,1);
x(n) = M(n,n+1) / M(n,n);

for iter = (n-1):-1:1
    sum = 0;
    for t = (iter+1):n
        sum = sum + M(iter,t) * x(t);
    end
    x(iter) = (M(iter,n+1) - sum) / M(iter,iter);
end
% disp(x);
end
