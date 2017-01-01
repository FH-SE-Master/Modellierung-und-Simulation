evoCfg          = [];
evoCfg.mu       = 10;    % parents
evoCfg.lambda   = 50;    % mutants per parent
evoCfg.delta    = 0.9;   % delta for mutation
evoCfg.deltaMin = 0.001; % minimum for delta
evoCfg.genMax   = 100;   % maximum generations

% SIR parameters 
optCfg          = [];
optCfg.alphaMax = 5;
optCfg.betaMax  = 5;
optCfg.iStart   = 1;
optCfg.tStart   = 0; 
optCfg.tStep    = 0.005;
optCfg.tMax     = 15;  
optCfg.N        = 763;
optCfg.infected = [1 5 10 30 90 220 280 240 230 190 130 80 55 15 4];

% Perform optimizations
result = OptimizeSIR(optCfg, evoCfg);

% get alpha and beta values for plotting
sizeMutants = size(result.generations);
alphaValues = [];
betaValues  = [];
for i=1:sizeMutants(2)
    alphaValues(i) = result.generations{i}.alpha;
    betaValues(i)  = result.generations{i}.beta;
end

% plot aplha and beta
figure;
hold on; 
plot(1:1:sizeMutants(2), betaValues);
plot(1:1:sizeMutants(2), alphaValues);
xlabel('idx')
legend('alpha', 'beta');

hold off;