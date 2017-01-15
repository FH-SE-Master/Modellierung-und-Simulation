function result = epidemiologySIRGroups(config, data)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    dataSize  = size(data);
    dataCount = dataSize(1,2);
    idx       = 1;
    runCont(1:dataCount) = struct('i', 0, 'r', 0, 's', 0);
    
    for j=1:1:dataCount
        curData = data(j); 
        runCont(j) = struct('i', curData.iStart, ...
                            'r', curData.rStart, ...
                            's', (curData.N - curData.iStart - curData.rStart));
    end

    result(1:dataCount) = struct('iProg', zeros(config.tMax/config.tStep+1,1), ...
                                 'sProg', zeros(config.tMax/config.tStep+1,1), ...
                                 'rProg', zeros(config.tMax/config.tStep+1,1));

    % main loop for time
    for t=config.tStart:config.tStep:config.tMax
        
        % loop for given data groups
        for j=1:1:dataCount
            curRun  = runCont(j); 
            curData = data(j); 
            
            % old current values
            s     = curRun.s;
            i     = curRun.i;
            r     = curRun.r;
            sum   = 0;
            alpha = curData.alpha;
            beta  = curData.beta;
            
            % calcuate group-wide infections for current group
            for k=1:1:dataCount
                sData = data(k);
                sum = sum + ((sData.k * sData.m(j)) * (runCont(k).i/sData.N));
            end
            
            s_ = (-alpha * sum * s);
            i_ = (alpha  * sum * s) - (beta * i);
            r_ =                      (beta   * i);
                        
            % set new current values for next iteration
            runCont(j) = struct('s', (s + (s_ * config.tStep)), ...
                                'i', (i + (i_ * config.tStep)), ...
                                'r', (r + (r_ * config.tStep)));
                            
            % remember results
            result(j).sProg(idx) = runCont(j).s;
            result(j).iProg(idx) = runCont(j).i;
            result(j).rProg(idx) = runCont(j).r;
            
        end  
        
        idx = idx + 1;          
    end
end

