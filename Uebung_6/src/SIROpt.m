function result = SIROpt(alpha, beta)
    if nargin==0
        alpha = 1;
        beta = 2;
    end

    N = 763;
    
    tStep = 0.005;
    tMax  = 14;
    
    s = N - 1;
    i = 1;
    r = 0;

    sProgress = zeros(tMax/tStep+1,1);
    iProgress = zeros(tMax/tStep+1,1);
    rProgress = zeros(tMax/tStep+1,1);
    myInfectedPupils = zeros(15,1);
    j = 1;
    
    for t=0:tStep:tMax
        s_ = -alpha * s * i / N             ;
        i_ =  alpha * s * i / N - beta * i  ;
        r_ =                      beta * i  ;
        
        s = s + s_ * tStep;
        i = i + i_ * tStep;
        r = r + r_ * tStep;
         
        iProgress(j) = i;
        sProgress(j) = s;
        rProgress(j) = r;
        j = j+1; 
        
        if t == round(t)
           myInfectedPupils(t+1) = i; 
        end
    end
    
    infectedPupils = [1 5 10 30 90 220 280 240 230 190 130 80 55 15 4];
    result = 0;
    for i = 1:15
        result = result + (myInfectedPupils(i) - infectedPupils(i))^2;
    end
end

