% Prepare model parameters
fileName    = 'parametrized_lunar_landing_modified';
modelParams = [1 22 48.2 19.8 40.8];
simParams   = simget(fileName);

% ----------------------------------------------------------------------
% test euler
% ----------------------------------------------------------------------
simParams.Solver = 'euler';
% run simulation
[T,X] = sim(fileName,100,simParams,modelParams);

% get height
h    = X.signals(1).values;
% get min height
minHEuler = min(h);

impactIdx        = find(h < 0);
qualityEuler = X.signals(2).values(impactIdx(1));

% ----------------------------------------------------------------------

% ----------------------------------------------------------------------
% Test fix step
% ----------------------------------------------------------------------
simParams.Solver = 'FixedStepAuto';
% run simulation
[T,X] = sim(fileName,100,simParams,modelParams);

% get height
h    = X.signals(1).values;
% get min height
minHAuto = min(h);

impactIdx   = find(h < 0);
qualityAuto = X.signals(2).values(impactIdx(1));
% ----------------------------------------------------------------------

% ----------------------------------------------------------------------
% Test fix step
% ----------------------------------------------------------------------
simParams.Solver = 'VariableStepAuto';
% run simulation
[T,X] = sim(fileName,100,simParams,modelParams);

% get height
h    = X.signals(1).values;
% get min height
minHVAuto = min(h);

impactIdx   = find(h < 0);
qualityVAuto = X.signals(2).values(impactIdx(1));
% ----------------------------------------------------------------------