function [x] = CG(A, b)
n = size(A, 1);
x = zeros(n,1);
r = b - A * x;
p = r;
error = 1e-5;
steps = [];
v = [];

for k=1:n
    if (r == 0)
        break;
    end
    inr = dot(r,r);
    inp = dot(p, A*p);
  
    alpha = inr / inp;
    newx = x + alpha * p;
    r = r - alpha * A * p;
    beta = dot(r,r) / inr;
    p = r + beta * p;
    
    e = norm(newx-x);
   
    x = newx;
    v = [v e];
    steps = [steps k];
    if e <= error
        break;
    end
end
% plot(steps,v);
% xlabel('steps');
% ylabel('relative error');
% title('converge cure');
end

