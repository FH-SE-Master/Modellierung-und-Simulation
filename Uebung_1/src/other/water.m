function water(tStep, tMax)
    if (nargin == 0)
        tStep= 0.01;
        tMax = 100;
    end
    
    A = -0.013;
    B = 0.1;
    u = 5000;
    x0 = 100000;
    
    syms tau;
    i = 1;
    for t=0:tStep:tMax
        xt = expm(t*A)*x0+int(expm((t-tau)*A)*B*u,tau,0,t);
        xt = double(xt);
        x(i) = xt;
        i = i + 1;
    end
    
    plot(x);        
end

