% simulation parameters
tStep  = 0.01;
tMax   = 100;
tSart  = 1;
% simulation arguments
alpha  = 0.2;
a      = 0.1;
b      = 0.025;
At     = 1;
% result matrizes 
res    = [];
tSteps = [];
i      = 1;
for t=tSart:tStep:tMax
    % discrete calculation of A(n+1)
    At = (alpha * At) + (a + (b * (cos(pi*(t-8)/12))));
    
    res(i)    = At; 
    tSteps(i) = t;
    i         = i + 1;
end

% plot results
figure;
plot(tSteps, res);
xlabel('time')
legend('A(t): (alpha * At) + (a + b * (cos(pi*(t-8)/12)))');