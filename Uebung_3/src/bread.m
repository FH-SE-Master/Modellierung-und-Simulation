function result = bread(solution, cfg, offset)
% Breads the mutants for the given candidate
% @param solution the solution to bread mutants for
% @param cfg      the config holding the lambda
% @param offset   the offset for the solution index because merged outside

result      = [];
population  = [];
qualities   = [];

% generate lambda mutants for the given candidate
for i=1:cfg.lambda
    idx            = i + (cfg.lambda * offset);
    tmpSolution    = mutate(solution, cfg);
    tmpSolution    = evaluate(tmpSolution, cfg);
    population{i}  = tmpSolution;
    qualities(i,:) = [tmpSolution.quality idx];
end

% build result
result.population = population;
result.qualities  = qualities;

end

