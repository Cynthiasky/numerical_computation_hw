function [res] = trapezoid(a,b,n)
    h = (b - a) / (n-1);
    res = func2(a) + func2(b);
    
    for k = 1:(n-2)
        xk = a + k * h;
        res = res + 2*func2(xk);

    end
    res = res * h/2;
end

