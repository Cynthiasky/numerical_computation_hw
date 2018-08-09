fidin = fopen('soc-Epinions1.txt');
fidout = fopen('data.txt','w');
while ~feof(fidin)
    line = fgetl(fidin);
    if(double(line(1)) >= 48 && double(line(1)) <= 57)
        fprintf(fidout,'%s\n',line);
    end
end
fclose(fidout);
D = load('data.txt');

E = 508837;
N = 75879;
M = 75887;
X = D(:,1);
Y = D(:,2);
record = [];
for k=M:-1:2
    t = find(X == k);
    if(size(t) == 0)
        record = [record k];
        M = M-1;
        disp(M);
    end
    if M == N
        break;
    end
end
disp(record);
