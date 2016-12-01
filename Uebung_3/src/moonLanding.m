% -------------------------------------------------
% The main program with the evolution algorithm
% S1610454013, Thomas Herzog
% -------------------------------------------------
% Prepare the algorithm constants
% -------------------------------------------------
cfg                   = [];
cfg.timeSpan          = 100;
cfg.mu                = 5;
cfg.lambda            = 10;
cfg.delta             = 10;
cfg.punish            = 0.1;
cfg.deltaStep         = 1;
cfg.simFile           = 'parametrized_lunar_landing';
cfg.simParams         = simget(cfg.simFile);
cfg.maxValue          = 100;
cfg.maxUnsuccessCount = 50;
cfg.maxGenerations    = 50;

% -------------------------------------------------
% Prepare main programm members
% -------------------------------------------------
runCount          = 1;
run               = 1;
generationCount   = 1;
curUnsuccessCount = 1;
curBestQuality    = 1000;
bestQualities     = [];
bestSolutions     = [];
meanQualities     = [];
population        = [];
initialVektor     = [];

% initial candiadte
initialVektor.start1 = 14;
initialVektor.end1   = 20;
initialVektor.start2 = 10;
initialVektor.end2   = 15;
population{1}        = initialVektor;

% -------------------------------------------------
% Main loop
% -------------------------------------------------
while (run == 1)
    result        = [];
    newGeneration = [];
    qualities     = [];
    solutions     = [];
    
    % 1. Select
    for i=1:cfg.mu
        idxSize          = size(population);             
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
        result        = bread(solution, cfg, (i - 1));
        newGeneration = [newGeneration result.population];
        qualities     = [qualities; result.qualities];
        solutions     = [solutions result.population];
    end
    
    % Selektion of the mu best
    qualities = sortrows(qualities);
    population     = [];
    for i=1:1:cfg.mu
      population{i} = newGeneration{qualities(i,2)};  
    end
    
    % Filll memory and modify delta depending on qualtity
    bestQuality                = qualities(1,1);
    meanQuality                = mean(qualities);
    sizeQualities              = size(qualities);
    bestQualities(runCount,1)  = bestQuality;
    bestQualities(runCount,2)  = runCount;
    bestSolutions{runCount}    = solutions{qualities(1,2)};  
    meanQualities(runCount,1)  = meanQuality(1,1);
    meanQualities(runCount,2)  = runCount;
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
        % If we found a new best decrease unseuccess counter
        if curUnsuccessCount > 0
            curUnsuccessCount = curUnsuccessCount - 1;
        end
    % If we didn't found a new best decrease unseuccess counter
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
    run             = ((generationCount < cfg.maxGenerations) && (curUnsuccessCount < cfg.maxUnsuccessCount));
    generationCount = generationCount + 1;
    runCount        = runCount + 1;
end

% -------------------------------------------------
% Plot the results
% -------------------------------------------------
sortedBestQualities  = sortrows(bestQualities);
sortedMeanQualities  = sortrows(meanQualities);

runBestQuality       = sortedBestQualities(1,1);
runMeanQuality       = sortedMeanQualities(1,1);
runBestSolution      = bestSolutions{sortedBestQualities(1,2)};

sizeBestQualities    = size(bestQualities);
figure;    
xAxis                = 1:(sizeBestQualities(1,1));  
yAxisBest            = bestQualities(:,1);
yAxisMean            = meanQualities(:,1);                        
plot(xAxis, yAxisBest, xAxis, yAxisMean);
hold on                                
xlabel('Generation');   
ylabel('quality');                            
legend({'beat quality/generation','mean quality/generation'})        
