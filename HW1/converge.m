N = [10 50 100 200];

for k = 1:4
    A = randn(N(k));
    b = randn(N(k),1);
    % generate strict diag dominance matrix
    for i=1:N(k)
        A(i,i) = sum(abs(A(i,:)));
    end
%     jacobi(A,b);
%     Gauss_Seidel(A,b);
%     SOR(A,b,1.5);
    CG(A,b);
    
    hold on;
end