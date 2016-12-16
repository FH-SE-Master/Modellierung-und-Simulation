function predatorprey(alpha, beta, gamma, delta, B0, R0)

    if nargin==0
        alpha = 0.15;
        beta  = 0.002;
        gamma = 0.1;
        delta = 0.001;
        B0    = 100;
        R0    = 25.1;
    end
    
    tStep = 0.001;
    tMax = 1000;
    
    b = B0;
    r = R0;
    e1 = 0;
    e2 = 0;
    
    bProgress = zeros(tMax/tStep+1,1);
    rProgress = zeros(tMax/tStep+1,1);
    i = 1;
    
    for t=0:tStep:tMax
        
        if t==(tMax/2)
            e1 = 0.02;
            e2 = 0.02;
        end
        
        b_ = alpha * b - beta*b*r - e1 * b;
        r_ = -gamma*r + delta*b*r - e2 * r;
        
        b = b+b_*tStep;
        r = r+r_*tStep;
        
        bProgress(i) = b;
        rProgress(i) = r;
        i = i+1;
        
    end
    
    title ('of bunnies and foxes');
    plot(0:tStep:tMax, [bProgress, rProgress]);
    figure
    title ('of bunnies and foxes');
    plot(bProgress, rProgress);
    xlabel('B');
    ylabel('R');
    %hold on
    %xlabel('t');
    %legend('B', 'R');

end

