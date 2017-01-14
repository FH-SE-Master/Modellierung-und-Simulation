function epidemiologySIROrig(alpha, beta, N, mu, p)
% a1 - a6 are factors for the limit cycles

    if nargin==0
        alpha = 50;
        beta  = 10;
        N     = 1000;
        % long term parameters
        mu    = 0.0005; % death rate
        p     = 0.6;    % immunization rate
    end
    
    tStep = 0.001;
    tMax  = 2;
    
    i = 1;
    r = 0;
    s = N - i - r;
    
    sProgress = zeros(tMax/tStep+1,1);
    iProgress = zeros(tMax/tStep+1,1);
    rProgress = zeros(tMax/tStep+1,1);
    j = 1;
    
    for t=0:tStep:tMax
        
        % no demographic observation
        s_ = -alpha * s * i / N;
        i_ =  alpha * s * i / N - beta * i;
        r_ =                      beta * i;
        
        % demographic observation
        %                                      deaths      immunization
        %s_ = -alpha * s * i / N             - (mu * s) + (mu * N * (1-p));
        %i_ =  alpha * s * i / N - beta * i  - (mu * i);
        %r_ =                      beta * i  - (mu * r) + (mu * N * p);
        
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
    
    % plot x=S, y=I
    figure;
    plot(sProgress, iProgress);
    title('I over S');
    xlabel('S');
    ylabel('I');

end

