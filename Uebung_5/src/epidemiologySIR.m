function result = epidemiologySIR(tStart, tStep, tMax, alpha, beta, iStart, N, mu, p)
% Does not work properly, don't know why yet !!!!!

    % simulation arguments
    i = iStart;
    r = N - i;
    s = N - i - r;
    
    if nargin == 7
        mu = 0;
        p  = 1;
    end
    if nargin == 8
        p = 1;
    end

    sProgress = zeros(tMax/tStep+1,1);
    iProgress = zeros(tMax/tStep+1,1);
    rProgress = zeros(tMax/tStep+1,1);
    j = 1;

    for t=tStart:tStep:tMax
        %                                       birth rate
        s_ = -alpha * s * (i / N)               + (mu * N * (1 - p));
        i_ =  alpha * s * (i / N) - beta * i;
        r_ =                        beta * i    + (mu * N * p);
        
        s = s + s_ * tStep;
        i = i + i_ * tStep;
        r = r + r_ * tStep;
        
        N_ = i + s + r;
        
        iProgress(j) = i;
        sProgress(j) = s;
        rProgress(j) = r;
        j = j+1;
          
    end
    
    result.iProg = iProgress;
    result.sProg = sProgress;
    result.rProg = rProgress;
end

