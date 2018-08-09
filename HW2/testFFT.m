% test code for myFFT
% some lines are from fft examples in mathworks.cn

N = 1024;

Fs = 1000;                    % Sampling frequency
T = 1/Fs;                     % Sampling period
L = 1024;                     % Length of signal
t = (0:L-1)*T;                % Time vector

X = 0.7 * sin(2*pi*50*t) + 0.5 * sin(2*pi*150*t) + ...
    0.3 * sin(2*pi*20*t) + sin(2*pi*90*t);

% plot(1000*t(1:50),X(1:50));

Y1 = fft(X,N);

P2 = abs(Y1/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,P1,'red');
hold on;


Y2 = myFFT(X,N);

P4 = abs(Y2/L);
P3 = P4(1:L/2+1);
P3(2:end-1) = 2*P3(2:end-1);
plot(f,P3,'blue');
hold on;


