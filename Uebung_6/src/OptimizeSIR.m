function result = OptimizeSIR(optCfg, evoCfg)
% performs the optimization of the SIR modell

    % initial calculation
    parent         = [];
    parent.alpha   = rand * optCfg.alphaMax;
    parent.beta    = rand * optCfg.betaMax;
    population{1}  = parent; 
    gBestFitness   = EvaluateFitness(parent, optCfg);  
    generations    = [];
    resFitness     = [gBestFitness 1];
    
    % run for generations
    for gen=1:evoCfg.genMax
        sizeGenerations = size(population);
        
        % bread for each parent mu mutants
        for pIdx=1:1:sizeGenerations(2)
            parent = population{pIdx};
            
            % bread and evaluate
            resBread    = Bread(parent, optCfg, evoCfg, sizeGenerations(2));
            % merge parents with mutants (+ stragedy)
            population = [population resBread.resMutants];
            % merge parent fitness and mutant fitness
            resFitness  = [resFitness; resBread.resFitness];
        end
        
        % selection process
        newPopulation  = []; 
        sortedFitness  = sortrows(resFitness);
        resFitness     = [];  
        sizeSorted     = size(sortedFitness);
        endIdx         = evoCfg.mu;
        if sizeSorted(1) < endIdx
            endIdx = sizeSorted(1);
        end
        % Current best fitness
        curBestFitness = sortedFitness(1,1);
       
        % Get mu best of population
        for i=1:1:endIdx
            idx              = sortedFitness(i,2);
            newPopulation{i} = population{idx};  
            resFitness(i,1)  = sortedFitness(i,1);
            resFitness(i,2)  = idx;
        end
        
        % check if new best fitness has been found
        if curBestFitness < gBestFitness 
            gBestFitness = curBestFitness;
            % increase delta
            evoCfg.delta = evoCfg.delta / 0.9;
        else
            % decrease delta
            evoCfg.delta = evoCfg.delta * 0.9;
        end
        
        % prevent to small delta
        if evoCfg.delta < evoCfg.deltaMin
            evoCfg.delta = evoCfg.deltaMin;
        end
        
        % save generation results
        population         = newPopulation;
        generations        = [population generations];
    end
    
    % build result container
    result.generations        = generations;
    result.bestFitness = gBestFitness;
end

