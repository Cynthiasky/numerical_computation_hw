N = [10 50 100 200];
Y1 = zeros(1,4);
Y2 = zeros(1,4);

for i = 1:4
    A = randn(N(i));
    b = randn(N(i), 1);
    tic;
    Gaussian(A, b);
    Y1(i) = toc;
    tic;
    Gaussian_colpivot(A, b);
    Y2(i) = toc;
    
end
plot(N, Y1,'B');
hold();
plot(N, Y2,'R');
xlabel('n');
ylabel('time');
title('time used as dim n changes');