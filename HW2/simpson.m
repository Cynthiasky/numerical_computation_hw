function [res] = simpson(a,b,n)
    h = (b - a) / (n-1);
    res = func2(a) + func2(b) + 4 * func2(a+h/2);
    
    for k = 1:(n-2)
        xk = a + k * h;
        xhalf = xk + h/2;
        
        res = res + 4*func2(xhalf) + 2*func2(xk);

    end
    res = res * h/6;
end

