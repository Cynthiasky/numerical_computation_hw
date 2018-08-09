N = 75888;
E = 508837;
error = 1e-5;
I = ones(N,1);
v = 1/N * ones(N,1);
beta = 0.05; % use this value as google did
D = load('data.txt');
X = D(:,1) + ones(E,1);
Y = D(:,2) + ones(E,1);
% A = sparse(N,N);
A = sparse(Y',X',1,N,N);
% for i=1:E
%     A(Y(i)+1,X(i)+1) = 1;
% end
fprintf('init finished\n');

for i=1:N
    temp = sum(A(:,i));
    if(temp == 0 || temp == 1)
        continue;
    end
    A(:,i) = A(:,i) / temp;
end

for k=1:1e+10
    newv = (1-beta) * A * v + beta * 1/N * I;
    if norm(newv-v) <= error
        v = newv;
        break;
    end
    v = newv;
    fprintf('%dth iter\n', k);
end

% choose the range to show in bars
show = 500; % should in range(E)
nodes = 1:show;
temp = v(1:show);
bar(nodes,temp');
title('pagerank result');
xlabel('nodes');
ylabel('PR value');
fprintf('sum of all is: %d\n',sum(v));