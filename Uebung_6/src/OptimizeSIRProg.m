evoCfg          = [];
evoCfg.mu       = 2;   % parents
evoCfg.lambda   = 5;  % mutants per parent
evoCfg.stragedy = '+'; % evo stragedy
evoCfg.delta    = 0.5; % delta for mutation
evoCfg.genMax   = 1;

optCfg          = [];
optCfg.alphaMax = 5;
optCfg.betaMax  = 5;
optCfg.iStart   = 1;
optCfg.tStart   = 0; 
optCfg.tStep    = 0.001;
optCfg.tMax     = 14;  
optCfg.infected = [1 5 10 30 90 220 280 240 230 190 130 80 55 15 4];

alphaIdx = 1;
evalRes  = [];

result = OptimizeSIR(optCfg, evoCfg);

sizeFitness = size(result.generationsFitness);
figure;
hold on; 
plot(1:1:sizeFitness(2), result.generationsFitness(1,:));
xlabel('idx')
legend('fitness');

hold off;
