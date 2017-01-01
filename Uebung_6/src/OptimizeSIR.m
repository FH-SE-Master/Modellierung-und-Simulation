function result = OptimizeSIR(optCfg, evoCfg)
    
    % initial calculation
    parent         = [];
    parent.alpha   = rand * optCfg.alphaMax;
    parent.beta    = rand * optCfg.betaMax;
    population{1}  = parent; 
    resFitness     = [];
    generations    = [];
    generationsFitness = [];
    
    % run for generations
    for gen=1:evoCfg.genMax
        sizeGenerations = size(population);
        
        % bread for each parent mu mutants
        for pIdx=1:1:sizeGenerations(2)
            parent = population{pIdx};
            
            % bread and evaluate
            resBread    = Bread(parent, optCfg, evoCfg);
            % merge generations with mutants
            population = [population resBread.resMutants];
            % merge fitness
            resFitness  = [resFitness resBread.resFitness];
        end
        
        % selection process
        newPopulation  = []; 
        bestFitness    = []; 
        sortedFitness = sortrows(resFitness);
        
        for i=1:1:evoCfg.mu
            newPopulation{i} = population{sortedFitness(i,2)};  
            bestFitness(i)   = sortedFitness(i,1);
        end
        
        population         = newPopulation;
        generations        = [population generations];
        generationsFitness = [generationsFitness bestFitness];
    end
    
    result.generations        = generations;
    result.generationsFitness = generationsFitness;
end

