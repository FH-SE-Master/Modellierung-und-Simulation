function SIROptApp()
    alpha = rand * 5;
    beta = rand * 5;
    sigma = 0.5;
    fitness = Evaluate(alpha, beta);
    for gen = 1:100
        alphaProgress(gen) = alpha;
        betaProgress(gen) = beta;
        a = alpha + randn * sigma;
        b = beta + randn * sigma;
        fitnessMutant = Evaluate(a,b);
        if(fitnessMutant < fitness)
           alpha = a;
           beta = b;
           fitness = fitnessMutant;
           sigma = sigma / 0.9;
        else
            sigma = sigma * 0.9;
        end
        
        if sigma < 0.001
           sigma = 0.001; 
        end
    end
end