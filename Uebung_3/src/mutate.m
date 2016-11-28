function solution = mutate(solution, cfg)
% Performs the mutation of the current solutions

% Mutate first thrust
solution.start1 = solution.start1 + (rand * cfg.delta);
solution.end1 = solution.start1 + (rand * cfg.delta);
while solution.end1 >= solution.start1
    solution.end1 = solution.start1 + (rand * cfg.delta);
end

% Mutate second thrust
solution.start2 = solution.start2 + (rand * cfg.delta);
solution.end2 = solution.start2 + (rand * cfg.delta);
while solution.end2 >= solution.start2
    solution.end2 = solution.start2 + (rand * cfg.delta);
end

% Reset members
solution.quality          = [];
solution.heightPRogress   = [];
solution.velocityProgress = [];

end

