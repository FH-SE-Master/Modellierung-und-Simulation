cfg                   = [];
cfg.timeSpan          = 100;
cfg.lambda            = 10;
cfg.mu                = 100;
cfg.deltaInit         = 1;
cfg.simFile           = 'parametrized_lunar_landing';
cfg.simParams         = simget(cfg.simFile);
cfg.curBestQuality    = 1000;
cfg.maxUnsuccessCount = 100;
cfg.curUnsuccessCount = 10;
cfg.maxGenerations    = 100;

run               = TRUE;
curGeneration     = 1;
curUnsuccessCount = 1;

cfg.bestQualities     = [];
while (run)
    
    
    
    % Determine if continue
    run = ((curGeneration < cfg.maxGenerations) || (curUnsuccessCount < cfg.curUnsuccessCount));
    curGeneration = curGeneration + 1;
    
end


optimizeLanding(cfg);