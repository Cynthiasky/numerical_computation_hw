N = [10 50 100 200];
Y = zeros(6,4);

for i=1:4
    A = randn(N(i));
    b = randn(N(i),1);
    % generate strict diag dominance matrix
    for k=1:N(i)
        A(k,k) = sum(abs(A(k,:)));
    end
    tic;
    jacobi(A, b);
    Y(1,i) = toc;
    
    tic;
    Gauss_Seidel(A, b);
    Y(2,i) = toc;
    
    tic;
    SOR(A, b, 1.3);
    Y(3,i) = toc;
    
    tic;
    CG(A, b);
    Y(4,i) = toc;
    
    tic;
    Gaussian(A,b);
    Y(5,i) = toc;
    
    tic;
    Gaussian_colpivot(A,b);
    Y(6,i) = toc;
end

for i=1:6
    plot(N,Y(i,:));
    txt = ['\leftarrow method', num2str(i)];
    text(N(4),Y(i,4),txt);
    hold on;
end

xlabel('dim num n');
ylabel('time');
title('time used as dim changes');