function result = bread(solution, cfg)
% Breads the mutants for the given candidate

result      = [];
population  = [];
qualities   = [];

% generate lambda mutants for the given candidate
for i=1:cfg.lambda
    % mutate from parent
    solution          = mutate(solution, cfg);
    % evaluate new mutant
    solution          = evaluate(solution, cfg);
    
    % set new candidate and map quality to candidate index
    population{i}     = solution;
    qualities(i, 1)   = solution.quality;
    qualities(i, 2)   = i;
end

% build result
result.population = population;
result.qualities  = qualities;

end

