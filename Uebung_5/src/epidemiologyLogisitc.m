function result = epidemiologyLogisitc(tStart, tStep, tMax, N, k)
% Epidiomology with logisitc model

    % Simulation arguments
    beta  = k/N;
    alpha = k;
    i     = 1;     % start one injected, otherwise desease cannot spread
    idx   = 1;     % matrix index

    % result matrizes
    result    = [];                    % result container
    sProgress = zeros(tMax/tStep+1,1); % susceptible
    iProgress = zeros(tMax/tStep+1,1); % infected

    for t=tStart:tStep:tMax
        % calculate deviation
        i_ = (i * alpha) - (i^2 * beta); 
        
        % calculate current infected
        i  = i + i_ * tStep;

        % keep current results
        iProgress(idx) = i;
        sProgress(idx) = N - i;

        % inc idx counter
        idx = idx + 1;
    end

    % set returned results
    result.iProg = iProgress;
    result.sProg = sProgress;

end

