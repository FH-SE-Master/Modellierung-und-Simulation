% simulation parameters
tStep  = 0.01;
tMax   = 48;
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
    % growth rate at t
    ft = (a + (b * (cos(pi*(t-8)/12))));
    % grotwh and decay
    At_ = (alpha * At) - (At * ft);
    % new At at t
    At  = At + (At_ * tStep);
    
    % save result
    res(i)    = At; 
    tSteps(i) = t;
    i         = i + 1;
end

% plot results
figure;
plot(tSteps, res);
xlabel('t')
ylabel('A')
legend('A(t)');