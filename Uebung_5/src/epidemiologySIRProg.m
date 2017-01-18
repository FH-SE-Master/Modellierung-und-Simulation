% simulation arguments
N       = 10000;
R0      = 7.5;              % Ro = alpha/beta
beta    = 1/10;             % one healing per 10-days
mu      = 0.0003;           % bearth rate
alpha_a = R0 * beta;        % alpha for a)
alpha_b = R0 * (beta + mu); % alpha for b)
iStart  = 1;                % start of infected
p_crit  = 1 - (1/R0);       % p_crit 

% Logisitc Simulation parameters 'epidemiologySIR'
tStart  = 0; 
tStep   = 0.001;
tMax    = 100;    
tMaxMuP = 10000;    

% with no mu and p_crit
resA = epidemiologySIR(tStart, tStep, tMaxMuP, alpha_a, beta, iStart, N);
% with mu and no p_crit
resB = epidemiologySIR(tStart, tStep, tMaxMuP, alpha_b, beta, iStart, N, mu);
% with mu and p_crit
resC = epidemiologySIR(tStart, tStep, tMaxMuP, alpha_b, beta, iStart, N, mu, p_crit);

% with no mu and p_cri
plotSir(resA, 'a) ', (tStart:tStep:tMaxMuP), num2str(N), num2str(alpha_a), ...
                      num2str(beta), 'undefined', 'undefined');
% with mu and no p_crit
plotSir(resB, 'b.1) ', (tStart:tStep:tMaxMuP), num2str(N), num2str(alpha_b), ...
                      num2str(beta), num2str(mu), 'undefined');
% with mu and p_crit
plotSir(resB, 'b.2) ', (tStart:tStep:tMaxMuP), num2str(N), num2str(alpha_b), ...
                      num2str(beta), num2str(mu), num2str(p_crit));
% with mu and p_crit (zoom for equilibrium)
plotSir(resB, 'b.2.1) ', (tStart:tStep:tMaxMuP), num2str(N), num2str(alpha_b), ...
                      num2str(beta), num2str(mu), num2str(p_crit));



