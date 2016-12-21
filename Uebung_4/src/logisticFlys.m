% Simulation parameters
tStep  = 0.01;
tMax   = 50;
tSart  = 1;
% simulation arguments
alpha  = 1/5;
beta   = 1/5175;
Pt     = 10;
% result matrizes 
res    = [];
tSteps = [];
    
% loop variables
j  = 1;
for t=tSart:tStep:tMax
    % continous calculation of Pt_
    Pt_        = alpha * Pt - (beta * Pt^2);
    Pt         = Pt + (Pt_ * tStep);
    res(j)     = Pt; 
    tSteps(j)  = t;
    j          = j + 1;
end

% plot results
figure;
plot(tSteps, res);
xlabel('time')
legend('A_(t): alpha * Pt - (beta * P^2)');