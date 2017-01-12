function sse = Evaulate(alpha, beta)
% Determines if alpha and beta are good factors

    tStep = 0.005;
    tMax  = 14;
    N     = 763;

    i = 1;
    r = 0;
    s = N - i - r;
    
    sProgress        = zeros(tMax/tStep+1,1);
    iProgress        = zeros(tMax/tStep+1,1);
    rProgress        = zeros(tMax/tStep+1,1);
    MyInfectedPupils = zeros(tMax + 1, 1);
    j                = 1;
    
    for t=0:tStep:tMax
        
        % calculate the alternation at t with no demographic observation
        s_ = -alpha * s * i / N;
        i_ =  alpha * s * i / N - beta * i;
        r_ =                      beta * i;
        
        % calucate current values
        s  = s + s_ * tStep;
        i  = i + i_ * tStep;
        r  = r + r_ * tStep;
        
        iProgress(j) = i;
        sProgress(j) = s;
        rProgress(j) = r;
        j            = j+1;
        
        % keep current value of each full day (0, 1, 2, ...)
        if t == round(t)
            MyInfectedPupils(t+1) = i;
        end
    end
    
    % calculate the quadratic deviation of the given and simulated values
    InfectedPupils = [1 5 10 30 90 220 280 240 230 190 130 80 55 15 4];
    sse = 0;
    for i=1:15
        sse = sse + (MyInfectedPupils(i) - InfectedPupils(i))^2;
    end
    
    
end

