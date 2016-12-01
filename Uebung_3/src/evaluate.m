function solution = evaluate(solution, cfg)
% Evaluates the simulation for the given candidate
% @param solution the solution to evaluate
% @param cfg      the configuration holding configurable constants

% Prepare model parameters
modelParams = [1, solution.start1, solution.end1,solution.start2, solution.end2];
% run simulation
[T,X] = sim(cfg.simFile,100,cfg.simParams,modelParams);

h                         = X.signals(1).values;
minH                      = min(h);
impactIdx                 = find(h == minH);
idx                       = impactIdx(1);
solution.heightProgress   = X.signals(1).values(idx);
solution.velocityProgress = -X.signals(2).values(idx);
    
% we haven't fully landed
if minH > 0
    solution.quality = (minH/10) + cfg.punish;
% We have landed already
else
    solution.quality = solution.velocityProgress;
end

end

