function result = epidemiologySIR(tStart, tStep, tMax, alpha, beta, iStart, N, mu, p)
% Does not work properly, don't know why yet !!!!!

    % simulation arguments
    i = iStart;
    r = 0;
    s = N - i - r;

    sProgress = zeros(tMax/tStep+1,1);
    iProgress = zeros(tMax/tStep+1,1);
    rProgress = zeros(tMax/tStep+1,1);
    j = 1;

    for t=tStart:tStep:tMax
        %                                       birth rate
        s_ = -alpha * s * (i / N);
        i_ =  alpha * s * (i / N) - (beta * i);
        r_ =                        (beta * i);
        
        % with birth rate
        if nargin == 8
            s_ = s_ + (mu * N);
            r_ = r_ + (mu * N);
        end
        if nargin == 9
            s_ = s_ + (mu * N * (1 - p));
            r_ = r_ + (mu * N * p);
        end

        s = s + s_ * tStep;
        i = i + i_ * tStep;
        r = r + r_ * tStep;
        
        sProgress(j) = s;
        iProgress(j) = i;
        rProgress(j) = r;
        
        j = j + 1;
          
    end
    
    result.iProg = iProgress;
    result.sProg = sProgress;
    result.rProg = rProgress;
end

