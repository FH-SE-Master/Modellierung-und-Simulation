function population = optimizeLanding(cfg)
% Performs the optimization of the landing

population = [];
solution   = [];

for i=1:cfg.mu
    solution = initialize(solution);
    population{i} = evaluate(solution, cfg);
end

end

