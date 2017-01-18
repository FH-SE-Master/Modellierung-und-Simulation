% simulation arguments
N       = 1000;
k       = [10,20,30,50];
kSize   = size(k);

% Logisitc Simulation parameters 'epidemiologyLogisitc'
ltStart = 0; 
ltStep  = 0.01;
ltMax   = 2;  

% Simulation parameters 'epidemiologyLogisitcProg'
start = 1;   
step  = 1;
max   = kSize(1,2);

% result container
results(start,max) = struct('iProg', [], 'sProg', []);

% for each paramter combination
for i=start:step:max
    % calculate progression for parameter combination
    res = epidemiologyLogisitc(ltStart, ltStep, ltMax, N, k(i));

    % plot each result in own window
    figure;
    hold on;
    
    title(strcat('N=1000, k=',num2str(k(i))));
    plot(ltStart:ltStep:ltMax, [res.iProg res.sProg]);
    xlabel('t')
    legend('I_t', 'S_t');
    
    hold off;
end


