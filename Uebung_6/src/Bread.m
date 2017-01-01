function result = Bread(parent, optCfg, evoCfg)

    result     = [];
    resMutants = [];
    resFitness = zeros(evoCfg.lambda, 2);
    
    % generate lambda mutants for the given candidate
    for i=1:evoCfg.lambda        
        % mutate 
        mutant.alpha = mod((parent.alpha + (randn * evoCfg.delta)), ...
                           optCfg.alphaMax);
        mutant.beta  = mod((parent.alpha + (randn * evoCfg.delta)), ...
                           optCfg.betaMax);
        
        % evaluate
        fitness = EvaluateFitness(mutant, optCfg);
        
        % set results
        resMutants{i}   = mutant;
        resFitness(i,1) = fitness;
        resFitness(i,2) = i;
    end
        
    result.resMutants = resMutants;
    result.resFitness = resFitness;
end