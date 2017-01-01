function result = Bread(parent, optCfg, evoCfg, offset)
% Breads and evaluates the mutants 

    result     = [];
    resMutants = [];
    resFitness = zeros(evoCfg.lambda, 2);
    
    % generate lambda mutants for the given parent
    for i=1:evoCfg.lambda        
        % mutate 
        mutant.alpha = (parent.alpha + (randn * evoCfg.delta));
        mutant.beta  = (parent.beta  + (randn * evoCfg.delta));
        
        % evaluate
        fitness = EvaluateFitness(mutant, optCfg);
        
        % set results
        resMutants{i}   = mutant;
        resFitness(i,1) = fitness;
        resFitness(i,2) = offset + i;
    end

    % build result container
    result.resMutants = resMutants;
    result.resFitness = resFitness;
end