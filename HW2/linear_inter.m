function [res] = linear_inter(f0, f1, x)
    res = f1(2) + (f0(2) - f1(2)) / (f0(1) - f1(1)) * (x - f0(1));
end
