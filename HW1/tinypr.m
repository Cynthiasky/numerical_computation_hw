N = 4;
E = 8;
error = 1e-5;
R = ones(N,1);
A = sparse(N,N);
v = 1/N * ones(N,1);
beta = 0.05; % use this value as google does
D = [0 1;0 2;0 3;1 0;1 2;2 3;3 0;3 1];
X = D(:,1);
Y = D(:,2);
X = int8(X);
Y = int8(Y);

for i=1:E
    A(Y(i)+1,X(i)+1) = 1;
end

for i=1:N
    temp = sum(A(:,i));
    if(temp == 0 || temp == 1)
        continue;
    end;
    A(:,i) = A(:,i) / temp;
end



for k=1:1e+50
    newv = (1-beta) * A * v + beta * 1/N * R;
    if norm(newv-v) <= error
        break;
    end
    v = newv;
    fprintf('%dth iter\n',k);
end
nodes = 1:N;
bar(nodes,v');
xlabel('nodes');
ylabel('PR value');