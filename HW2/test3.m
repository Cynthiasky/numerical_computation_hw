n = 10;
m = 10000;

A = randn(m,n);
b = randn(m,1);

% m = 5;
% n = 2;
% A = [1 0;0 1;1 1;2 1;3 1];
% b = [1;1;1;3;4];
x = RLS(A, b);
real = eye(n)/(A'*A)*A'*b;

count = 0;
error = 1e-2;
for i=1:n
    if abs(x(i)-real(i)) <= error
        count = count + 1;
    end
end
display(count);