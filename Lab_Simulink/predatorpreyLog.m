function predatorpreyLog(a1, a2, a3, a4, a5, a6, B0, R0)
% a1 - a6 are factors for the limit cycles

    if nargin==0
        a1 = 1;
        a2 = 1;
        a3 = 1.5;
        a4 = 0.4;
        a5 = 0.4;
        a6 = 1;
        B0 = 0.7;
        R0 = 0.2;
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
        
        if t == 200
            b = b + 0.3;
        end
        
        if t==(tMax/2)
            e1 = 0.05;
            e2 = 0.05;
        end
        
        b_ = (b * (a1 * (1 - b / a2) - a3 * r / (b + a4))) - (e1 * b);
        r_ = (r * a5 * (1 - a6 * r / b)) - (e2 * r);
        
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

