% simulation arguments
N       = 8000000;
R0      = 7.5;       % Ro = alpha/beta
beta    = 1/10;      % one healing per 10-days
mu      = 0.0003;
alpha_a = R0 * beta;
alpha_b = R0 * (beta + mu);
iStart  = 1;
p_crit  = 1 - (1/R0);     

% Logisitc Simulation parameters 'epidemiologySIR'
tStart = 0; 
tStep  = 0.001;
tMax   = 365;    

% result container
resA = epidemiologySIR(tStart, tStep, tMax, alpha_a, beta, iStart, N);
resB = epidemiologySIR(tStart, tStep, tMax, alpha_b, beta, iStart, N, mu);
resC = epidemiologySIR(tStart, tStep, tMax, alpha_b, beta, iStart, N, mu, p_crit);

% plot results
plotSir(resA, 'a) ', (tStart:tStep:tMax), num2str(N), num2str(alpha), ...
                      num2str(beta), 'undefined', 'undefined');
plotSir(resB, 'b.1) ', (tStart:tStep:tMax), num2str(N), num2str(alpha), ...
                      num2str(beta), num2str(mu), 'undefined');
plotSir(resB, 'b.2) ', (tStart:tStep:tMax), num2str(N), num2str(alpha), ...
                      num2str(beta), num2str(mu), num2str(p_crit));



