function result = epidemiologySIRGroups(config, groups)
% calculates the epidemiology for n given groups via an SIR model

    % simulation arguments
    groupSize  = size(groups);
    dataCount = groupSize(1,2);
    idx       = 1;
    runCont(1:dataCount) = struct('i', 0, 'r', 0, 's', 0);
    
    % initialize run container with start values
    for j=1:1:dataCount
        curData = groups(j); 
        runCont(j) = struct('s', (curData.N - curData.iStart), ...
                            'i', curData.iStart, ...
                            'r', 0);
    end

    % initialize result container
    result(1:dataCount) = struct('sProg', zeros(config.tMax/config.tStep+1,1), ...
                                 'iProg', zeros(config.tMax/config.tStep+1,1), ...
                                 'rProg', zeros(config.tMax/config.tStep+1,1));

    % main loop for time
    for t=config.tStart:config.tStep:config.tMax
        
        % loop for given data groups
        for j=1:1:dataCount
            curRun  = runCont(j);  % holds last current results or start values at begin
            curData = groups(j);     % the current group to calculate
            
            % old current values
            s     = curRun.s;
            i     = curRun.i;
            r     = curRun.r;
            sum   = 0;
            alpha = curData.alpha;
            beta  = curData.beta;
            
            % calcuate group-wide infections for current group
            for k=1:1:dataCount
                sData = groups(k);
                sum = sum + ((sData.k * sData.m(j)) * (runCont(k).i/sData.N));
            end
            
            % calculate deviation
            s_ = (-alpha * sum * s);
            i_ = (alpha  * sum * s) - (beta * i);
            r_ =                      (beta * i);
                        
            % set new current values for next iteration
            runCont(j) = struct('s', (s + (s_ * config.tStep)), ...
                                'i', (i + (i_ * config.tStep)), ...
                                'r', (r + (r_ * config.tStep)));
                            
            % remember results
            result(j).sProg(idx) = runCont(j).s;
            result(j).iProg(idx) = runCont(j).i;
            result(j).rProg(idx) = runCont(j).r;
            
        end  
        
        % increase group prog index 
        idx = idx + 1;          
    end
end

