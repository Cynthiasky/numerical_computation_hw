function [X] = myFFT(X,N)
    if N >= 2
        % divide
        temp = zeros(1,N/2);
        for i = 1:N/2
            temp(i) = X(i*2);
        end
        for i = 1:N/2
            X(i) = X(i*2-1);
        end
        for i = 1:N/2
            X(i+N/2) = temp(i);
        end
        % conquer
        X(:,1:N/2) = myFFT(X(:,1:N/2),N/2);
        X(:,(N/2)+1:N) = myFFT(X(:,(N/2+1):N),N/2);
        for k = 1:N/2
            w = exp(2i*pi*k/N);
            t = X(k);
            X(k) = t + w * X(k+N/2);
            X(k+N/2) = t - w * X(k+N/2);
        end
    end
end

