% simulation arguments
N       = 1000;
k       = [10,20,30,50];
kSize   = size(k);

% Logisitc Simulation parameters 'epidemiologyLogisitc'
ltStart = 0; 
ltStep  = 0.01;
ltMax   = 1.5;  

% Simulation parameters 'epidemiologyLogisitcProg'
tStart = 1;   
tStep  = 1;
tMax   = kSize(1,2);

% result container
results(tStart,tMax) = struct('iProg', [], 'sProg', []);

% for each paramter combination
for i=tStart:tStep:tMax
    % calculate progression for parameter combination
    res = epidemiologyLogisitc(ltStart, ltStep, ltMax, N, k(i));

    % plot each result in own windows
    figure;
    hold on;
    
    title(strcat('N=1000,k=',num2str(k(i))));
    plot(ltStart:ltStep:ltMax, [res.iProg res.sProg]);
    xlabel('time')
    legend('I_t', 'S_t');
    
    hold off;
end


