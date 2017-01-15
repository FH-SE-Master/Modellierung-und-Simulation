% simulation parameter
config        = [];
config.tStart = 0;
config.tStep  = 0.01;
config.tMax   = 0.6;

% simulation arguments
data(1) = struct('N', 1000, 'k', 2,  'iStart', 0, 'rStart', 0, ...
                 'alpha', 15, 'beta', 14, 'm', [0.9 0.05 0.05]);
data(2) = struct('N', 100,  'k', 10, 'iStart', 0, 'rStart', 0, ...
                 'alpha', 15, 'beta', 14, 'm', [0.1 0.7  0.2]);
data(3) = struct('N', 500,  'k', 4,  'iStart', 5, 'rStart', 0, ...
                 'alpha', 15, 'beta', (7 + (7/2)), 'm', [0.3 0.3  0.4]);
 
result = epidemiologySIRGroups(config, data);

for i=1:1:3
    curData = data(i);
    plotSir(result(i), ...
            strcat('Group ', num2str(i)), ...
            (config.tStart:config.tStep:config.tMax), ...
            num2str(curData.N), ...
            num2str(curData.alpha), ...
            num2str(curData.beta),  ...
            'undefined');
end




