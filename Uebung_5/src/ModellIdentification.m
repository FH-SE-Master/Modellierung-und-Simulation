function ModellIdentification
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    alphaStep = 0.02;
    betaStep  = 0.02;
    alphaMax  = 5;
    betaMax   = 5;
    
    alphaIdx = 1;
    
    % Each alpha value
    for alpha = 0:alphaStep:alphaMax
        
        betaIdx  = 1;
        
        % with each beta value
        for beta = 0:betaStep:betaMax
            % keep logarithmic value instead of original one (for ploting)
            f(betaIdx, alphaIdx) = log(Evaulate(alpha, beta));
            betaIdx = betaIdx + 1;
        end
        
        alphaIdx = alphaIdx + 1;
    end

    figure;
    pcolor(f);      % plot values colored
    shading interp;
    
    % manipulate x-axis
    set(gca, 'XTick', 0:50:250);
    xLabels = {'0', '1', '2', '3', '4', '5'};
    set(gca, 'XTickLabels', xLabels);
    
    % manipulate y-axis
    set(gca, 'YTick', 0:50:250);
    yLabels = {'0', '1', '2', '3', '4', '5'};
    set(gca, 'YTickLabels', yLabels);
    
    % ===============================================================
    % Evo-algo to find best solution candidate
    % ===============================================================
    alpha   = rand * alphaMax;
    beta    = rand * betaMax;
    genMax  = 100;
    
    sigma   = 0.5;
    fitness = Evaulate(alpha, beta);
    
    for gen=1:genMax
        alphaProg(gen) = alpha;
        betaProg(gen)  = beta;
        alphaN = alpha + randn * sigma;
        betaN  = beta + randn * sigma;
        
        fitnessMutant = Evaulate(alphaN, betaN);
        if fitnessMutant < fitness
            alpha   = alphaN;
            beta    = betaN;
            fitness = fitnessMutant;
            sigma = sigma / 0.9;
        else
            sigma = sigma *  0.9;
        end
        if sigma < 0.001
            sigma = 0.001;
        end
    end
    
    hold on;
    plot(alphaProg/alphaStep, betaProg/betaStep, 'r.-');
    hold off;
end

