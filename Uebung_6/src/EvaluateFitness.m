function result = EvaluateFitness(param, optCfg)
% Evaluates the fitness via the quadratic deviation 
% between the calculated and given values

    sirResult    = epidemiologySIR(optCfg.tStart, ... 
                                   optCfg.tStep, ...
                                   optCfg.tMax, ...
                                   param.alpha, ...
                                   param.beta, ...
                                   optCfg.iStart, ...
                                   optCfg.N);
        
    % Calculate quadractic devaition
    sizeInfected = size(optCfg.infected);
    result = 0;
    for i=1:sizeInfected(2)
        % Only take the values of full days
        sirIdx = ((optCfg.tMax/optCfg.tStep) / optCfg.tMax) * i;
        result = result + (sirResult.iProg(sirIdx) - optCfg.infected(i))^2;
    end
end

