% Simulation parameters
tStep  = 1;
tMax   = 50;
tSart  = 1;
% simulation arguments
alpha  = 1/5;
beta   = 1/5175;
C      = alpha / beta; % border to converge too
C99    = C * 0.99;     % 99% value 
Pt     = 10;           % initial flys
% result matrizes 
res    = [];
Pt_12  = 0;            % value at day 12
t_C99  = 0;            % days when 99% has beeen reached first

for t=tSart:tStep:tMax
    % continous calculation
    Pt_        = alpha * Pt - (beta * Pt^2);
    Pt         = Pt + (Pt_ * tStep);
    
    % save result
    res(t)     = Pt;
    
    % get value at day 12
    if t == 12
        Pt_12 = Pt;
    end;
    
    % get days when 99% has been reached first
    if t_C99 == 0 && Pt >= C99
        t_C99 = t;
        break;
    end;
end

% plot results
figure;
plot(1:tStep:t_C99, res);
xlabel('time')
legend('A_(t): alpha * Pt - (beta * P^2)');