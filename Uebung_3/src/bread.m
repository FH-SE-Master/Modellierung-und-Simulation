function population = bread(solution, cfg)
% Performs the optimization of the landing

result      = [];
population  = [];
qualities   = [];

for j=1:cfg.mu
    solution          = mutate(solution, cfg);
    solution          = evaluate(solution, cfg);
    population{i}     = solution;
    qualities(i, 1)   = solution.quality;
    qualities(i, 2)   = i;

    idx             = idx + 1;
end

result.population = population;

end

