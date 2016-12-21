% Simulation parameters
tStep = 0.01;
tMax  = 1003;

% Simulation arguments
alpha = 0.4;         % breath rate
gamma = 0.3;         % death rate
Mb    = 300;         % mean prey
Mr    = 50;          % mean preadator
beta  = alpha / Mr;  % Mr = alpha/beta
delta = gamma / Mb;  % Mb = gamma/delta
Rt    = 5;           % current preadator count (initially 5)
Bt    = 500;         % current prey count (initially 500)

% result container
bProg = zeros(tMax/tStep+1,1);
rProg = zeros(tMax/tStep+1,1);
i     = 1;

for t=0:tStep:tMax
    % change rate of prey at t
    Bt_ = (alpha * Bt) - (beta * Bt * Rt);
    % change rate of predator at t
    Rt_ = (-gamma * Rt) + (delta * Bt * Rt);
    % current prey at t
    Bt = Bt + (Bt_ * tStep);
    % current preadtor at t
    Rt = Rt + (Rt_ * tStep);

    % save results
    bProg(i) = Bt;
    rProg(i) = Rt;
    i = i + 1;

end

% plot P,B over t
figure;
plot(0:tStep:tMax, [bProg, rProg]);
title ('Predator and Prey');
xlabel('t')
ylabel('P,B')

% plot P over B
figure;
plot(bProg, rProg);
title ('Predator and Prey');
xlabel('B')
ylabel('P')


