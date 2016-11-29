cfg                   = [];
cfg.timeSpan          = 100;
cfg.mu                = 10;
cfg.lambda            = 100;
cfg.delta             = 5;
cfg.deltaStep         = 0.1;
cfg.simFile           = 'parametrized_lunar_landing';
cfg.simParams         = simget(cfg.simFile);
cfg.maxValue          = 100;
cfg.maxUnsuccessCount = 100;
cfg.curUnsuccessCount = 100;
cfg.maxGenerations    = 20;

runCount          = 1;
run               = 1;
generationCount     = 1;
curUnsuccessCount = 1;
curBestQuality    = 1000;
bestQualities     = [];
population        = [];
initSolution      = [];

% [14.4130]    [13.6334]    [17.8422]    [ 99.6011]    [9.7887e-04]    []    []
% initial candiadte
initSolution.start1 = 14;
initSolution.end1   = 13;
initSolution.start2 = 17;
initSolution.end2   = 99;
population{1}       = initSolution;

while (run == 1)
    result        = [];
    newGeneration = [];
    qualities     = [];
    
    % 1. Select
    for i=1:cfg.mu
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
        
        % 2. Bread, 3. Mutate
        result        = bread(solution, cfg);
        newGeneration = [newGeneration result.population];
        qualities     = [qualities; result.qualities];
    end
    
    % Selektion of the mu best
    qualities = sortrows(qualities);
    population     = [];
    for i=1:1:cfg.mu
      population{i} = newGeneration{qualities(i,2)};  
    end
    
    % Modify delta depending on qualtity
    bestQuality                = qualities(1,1);
    sizeQualities              = size(qualities);
    bestQualities(runCount,1) = bestQuality;
    betterCounter              = 0;
    for i=1:1:sizeQualities(1,2)
        if curBestQuality < bestQuality
            break;
        end
        betterCounter = betterCounter + 1;
    end
    % new best quality found
    if curBestQuality > bestQuality
        curBestQuality  = bestQuality;
    else
        curUnsuccessCount = curUnsuccessCount + 1;
    end
    % decrease step because quality is getting better
    if betterCounter >= (sizeQualities(1,1) / 5)
        cfg.delta = cfg.delta - cfg.deltaStep;
    % increase step because quality is getting worse
    else
        cfg.delta = cfg.delta + cfg.deltaStep;
    end
    
    oldBestQuality = curBestQuality;
    % Determine if continue
    run             = ((generationCount < cfg.maxGenerations) && (curUnsuccessCount < cfg.curUnsuccessCount));
    generationCount = generationCount + 1;
    runCount        = runCount + 1;
end

plot(bestQualities);