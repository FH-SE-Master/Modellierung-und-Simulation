cfg                   = [];
cfg.timeSpan          = 100;
cfg.mu                = 10;
cfg.lambda            = 100;
cfg.deltaInit         = 10;
cfg.simFile           = 'parametrized_lunar_landing';
cfg.simParams         = simget(cfg.simFile);
cfg.curBestQuality    = 1000;
cfg.maxUnsuccessCount = 100;
cfg.curUnsuccessCount = 10;
cfg.maxGenerations    = 100;

run               = 1;
curGeneration     = 1;
curUnsuccessCount = 1;
bestQualities     = [];
population        = [];

while (run == 1)
    newPopulation = [];
    % Initialize parents for mutation
    if isempty(population)
        for i=1:cfg.mu
            population{i} = initialize([]);
        end
    end
    
    % Select and mutate
    for i=1:cfg.lambda
        idxSize          = size(population);              % get size
        randMatrix       = randperm(idxSize(:,2));        % create random matrix
        idx              = randMatrix(1:1);               % get first item
        solution         = initialize(population(1,idx)); 
        solution         = mutate(solution, cfg);
        solution         = evaluate(solution, cfg);
        newPopulation{i} = solution;
        
        population(:,idx) = [];
    end
    population = newPopulation;
    
    % Mutate children
    for i=1:1:cfg.mu
        
    end
    
    % Determine if continue
    run = ((curGeneration < cfg.maxGenerations) || (curUnsuccessCount < cfg.curUnsuccessCount));
    curGeneration = curGeneration + 1;
end


optimizeLanding(cfg);