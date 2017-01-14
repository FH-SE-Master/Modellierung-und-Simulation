function result = epidemiologySIR(tStart, tStep, tMax, alpha, beta, N, mu)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    % simulation arguments
    i = 1;
    r = 7.5;
    s = N - i - r;

    sProgress = zeros(tMax/tStep+1,1);
    iProgress = zeros(tMax/tStep+1,1);
    rProgress = zeros(tMax/tStep+1,1);
    j = 1;

    for t=tStart:tStep:tMax
        if nargin == 6
            s_ = -alpha * s * i / N;
            i_ =  alpha * s * i / N - beta * i;
            r_ =                      beta * i; 
        else
            %                                       birth rate
            s_ = -alpha * s * i / N               + (mu * N);
            i_ =  alpha * s * i / N - beta * i;
            r_ =                      beta * i;
        end
        
        s = s + s_ * tStep;
        i = i + i_ * tStep;
        r = r + r_ * tStep;
        
        iProgress(j) = i;
        sProgress(j) = s;
        rProgress(j) = r;
        j = j+1;
          
    end
    
    result.iProg = iProgress;
    result.sProg = sProgress;
    result.rProg = rProgress;
end

