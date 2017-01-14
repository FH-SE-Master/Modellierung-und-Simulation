% simulation arguments
N      = 100000;
R0     = 7.5;
beta   = 1/10;      % one healing per 10-days
alpha  = R0 * beta;
mu     = 0.0003;

% Logisitc Simulation parameters 'epidemiologySIR'
tStart = 0; 
tStep  = 0.001;
tMax   = 500;    

% result container
resA = epidemiologySIR(tStart, tStep, tMax, alpha, beta, N);
resB = epidemiologySIR(tStart, tStep, tMax, alpha, beta, N, mu);

% plot results
plotSir(resA, 'a) ', (tStart:tStep:tMax), num2str(N), num2str(alpha), num2str(beta), 'undefined');
plotSir(resB, 'b) ', (tStart:tStep:tMax), num2str(N), num2str(alpha), num2str(beta), num2str(mu));



