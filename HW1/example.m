%%sparse matrices
n = 75888;
e = 508837;
D = load('data.txt');
X = D(:,1);
Y = D(:,2);
X = X + ones(e,1);
Y = Y + ones(e,1);

G = sparse(Y',X',1,n,n);
spy(G);
%% Page Rank
p = 0.85;
delta = (1-p)/n;
c = sum(G,1);
k = find(c~=0);
D = sparse(k,k,1./c(k),n,n);
e = ones(n,1);j;
I = speye(n,n);
x = (I - p*G*D)\e;
x = x/sum(x);
%% Conventional power method
z = ((1-p)*(c~=0) + (c==0))/n;
A = p*G*D + e*z;
x = e/n;
oldx = zeros(n,1);
while norm(x - oldx) > .01
oldx = x;
x = A*x;
end
x = x/sum(x);
%% Sparse power method
G = p*G*D;
x = e/n;
oldx = zeros(n,1);
while norm(x - oldx) > .01
oldx = x;
x = G*x + e*(z*x);
end
x = x/sum(x);
%% Inverse iteration
x = (I - A)\e;
x = x/sum(x);
%% Bar graph
bar(x)
title('Page Rank')