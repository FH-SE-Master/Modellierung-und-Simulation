cfg                   = [];
cfg.timeSpan          = 100;
cfg.mu                = 1;
cfg.lambda            = 10;
cfg.delta             = 10;
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
population{1}     = initialize([]); 

while (run == 1)
    result        = [];
    newPopulation = [];
    
    % Select
    for i=1:cfg.lambda
        idxSize          = size(population);              % get size
        % break if no further mutant available
        if idxSize(:,2) == 0
            break;
        end
        
        % random selection
        randMatrix       = randperm(idxSize(:,2));        
        idx              = randMatrix(1:1);               
        solution         = population{idx};
        population(:,idx) = [];
        
        % bread and mutate
        newPopulation = [newPopulation; bread(solution, cfg)];
    end
    
    % set new population
    population = newPopulation;
    
    % Determine if continue
    run = ((curGeneration < cfg.maxGenerations) || (curUnsuccessCount < cfg.curUnsuccessCount));
    curGeneration = curGeneration + 1;
end


optimizeLanding(cfg);