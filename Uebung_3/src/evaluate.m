function solution = evaluate(solution, cfg)
% Evaluates the simulation for the given candidate

% Prepare model parameters
modelParams = [1, solution.start1, solution.end1,solution.start2, solution.end2];
% run simulation
[T,X] = sim(cfg.simFile,100,cfg.simParams,modelParams);

% get height
h    = X.signals(1).values;
% get min height
minH = min(h);

% we haven't fully landed
if minH > 0
    solution.quality = minH/10;
% We have landed already
else
    impactIdx        = find(h < 0);
    solution.quality = -X.signals(2).values(impactIdx(1));
end

end

