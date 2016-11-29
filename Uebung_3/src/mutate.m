function solution = mutate(solution, cfg)
% Mutates the given candidate

% Mutate first thrust
tmpStart1 = mod(solution.start1 + (rand * cfg.delta), 100);
if tmpStart1 > cfg.maxValue
    solution.start1 = rand * cfg.delta; 
else
    solution.start1 = tmpStart1;
end
tmpEnd1    = mod(solution.end1 + (rand * cfg.delta), 100);
if tmpEnd1 > cfg.maxValue
    solution.end1 = rand * cfg.delta; 
else
    solution.end1 = tmpEnd1; 
end
while solution.end1 <= solution.start1
    solution.end1 = solution.end1 + (rand * cfg.delta);
end

% Mutate second thrust
tmpStart2 = mod(solution.start2 + (rand * cfg.delta), 100);
if tmpStart2 > cfg.maxValue
    solution.start2 = rand * cfg.delta;  
else
    solution.start2 = tmpStart2;
end
tmpEnd2   = mod(solution.end2 + (rand * cfg.delta), 100);
if tmpEnd2 > cfg.maxValue
    solution.end2 = rand * cfg.delta;
else
    solution.end2 = tmpEnd2;  
end
while solution.end2 <= solution.start2
    solution.end2 = solution.end2 + (rand * cfg.delta);
end

% Reset members
solution.quality          = [];
solution.heightPRogress   = [];
solution.velocityProgress = [];

end

