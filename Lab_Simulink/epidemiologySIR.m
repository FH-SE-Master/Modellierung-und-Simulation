function epidemiologySIR(alpha, beta, N)
% a1 - a6 are factors for the limit cycles

    if nargin==0
        alpha = 10;
        beta  = 1;
        N     = 10000;
    end
    
    tStep = 0.001;
    tMax  = 20;
    
    i = 1;
    r = 0;
    s = N - i - r;
    
    sProgress = zeros(tMax/tStep+1,1);
    iProgress = zeros(tMax/tStep+1,1);
    rProgress = zeros(tMax/tStep+1,1);
    j = 1;
    
    for t=0:tStep:tMax
        
        s_ = -alpha * s * i / N;
        i_ =  alpha * s * i / N - beta * i;
        r_ =                      beta * i;
        
        s = s + s_ * tStep;
        i = i + i_ * tStep;
        r = r + r_ * tStep;
        
        iProgress(j) = i;
        sProgress(j) = s;
        rProgress(j) = r;
        j = j+1;
        
    end
    
    figure;
    title ('S, I , R');
    plot(0:tStep:tMax, [sProgress, iProgress, rProgress]);
    xlabel('time')
    legend('S(t)', 'I(t)', 'R(t)');

end

