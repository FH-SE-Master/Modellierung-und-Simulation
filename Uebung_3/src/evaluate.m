function solution = evaluate(solution, cfg)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% Prepare model parameters
modelParams = [1, solution.start1, solution.end1,solution.start2, solution.end2];
[T,X] = sim(cfg.simFile,100,cfg.simParams,modelParams);

h    = X.signals(1).values;
minH = min(h);
if minH > 0
    solution.quality = minH/10;
else
    impactIdx        = find(h < 0);
    solution.quality = -X.signals(2).values(impactIdx(1));
end

end

