% Simulation parameters
tStep = 0.01;
tMax  = 1003;

% Simulation arguments
alpha = 0.4; % breath rate
gamma = 0.3; % death rate
Mb    = 300; % mean prey
Mr    = 50;  % mean preadator
beta  = alpha / Mr;  
delta = gamma / Mb; 
Rt    = 5;   % current preadator count (initially 5)
Bt    = 500; % current prey count (initially 500)

% result container
bProg = zeros(tMax/tStep+1,1);
rProg = zeros(tMax/tStep+1,1);
i     = 1;

for t=0:tStep:tMax
    % Continous calculation of predators and preys
    Bt_ = (alpha * Bt) - (beta * Bt * Rt);
    Rt_ = (-gamma * Rt) + (delta * Bt * Rt);

    Bt = Bt + (Bt_ * tStep);
    Rt = Rt + (Rt_ * tStep);

    % remember results
    bProg(i) = Bt;
    rProg(i) = Rt;
    i = i + 1;

end

% plot results
figure;
title ('Predator and Prey');
plot(0:tStep:tMax, [bProg, rProg]);


