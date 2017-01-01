function result = EvaluateFitness(param, optCfg)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

    sizeInfected = size(optCfg.infected);
    
    sirResult    = epidemiologySIR(optCfg.tStart, ... 
                                   optCfg.tStep, ...
                                   optCfg.tMax, ...
                                   param.alpha, ...
                                   param.beta, ...
                                   optCfg.iStart, ...
                                   sizeInfected(2));
        
    % Calculate quadractic devaition
    result = 0;
    for i=1:optCfg.tMax
        sirIdx = (1/optCfg.tStep) * i;
        result = result + (sirResult.iProg(sirIdx) - optCfg.infected(i))^2;
    end
    
end

