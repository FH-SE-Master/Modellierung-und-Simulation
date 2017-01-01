function result = epidemiologySIR(tStart, tStep, tMax, alpha, beta, iStart, N)
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
        %                                       
        s_ = -alpha * s * (i / N);
        i_ =  alpha * s * (i / N) - (beta * i);
        r_ =                        (beta * i);

        % calculate current value
        s = s + s_ * tStep;
        i = i + i_ * tStep;
        r = r + r_ * tStep;
        
        % save current result
        sProgress(j) = s;
        iProgress(j) = i;
        rProgress(j) = r;
        
        j = j + 1;
          
    end
    
    % set returned results
    result.iProg = iProgress;
    result.sProg = sProgress;
    result.rProg = rProgress;
end

