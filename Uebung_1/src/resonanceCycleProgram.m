% ------------------------- BEGIN Setup --------------------------------
% Here we initialize the starting test data
% ------------------------- BEGIN Setup --------------------------------
data.R1 = 1;
data.R2 = 2; 
data.C  = 3;   % 1   | 2   | 3
data.L  = 2.5; % 2.5 | 1.5
data.U  = 1;
%data.vector.A  = [data.R1/data.L -(1/data.L) ;
%                  1/data.C -(1/(data.C * data.R2))];

data.vector.A  = [(data.R1/data.L) -(1/data.L) ;
                 (1/data.C) -(1/(data.C * data.R2))];              
data.vector.B  = [(1/data.L); 0];
data.vector.C  = [0 1];
data.vector.X0 = [0 ; 0];
data.eval.tStart = 0;
data.eval.tEnd   = 50;
data.eval.tStep  = 0.5;
% ------------------------- END Setup ---------------------------------- 

% ------------------------- INIT RUN -----------------------------------
% Here we run our simulation runCount times, with the defined movements of
% the input variables
% ------------------------- INIT RUN ----------------------------------- 
i = 1;                      % init i run variable
tStart = data.eval.tStart;  % local tStart
tEnd   = data.eval.tEnd;    % local tEnd
tStep  = data.eval.tStep;   % local tStep
A      = data.vector.A;     % local A vector
B      = data.vector.B;     % local B vector
C      = data.vector.C;     % local C vector
X0     = data.vector.X0;    % local X0 vector
U      = data.U;            % local U voltage
xAxis = tStart:tStep:tEnd;  % allocate x-axis
yAxis = zeros(1, int8((tEnd - tStart) / tStep)); % allocate y-axis

syms tau;                   % register tau
for t=tStart:tStep:tEnd     % loop over simulation time frame
    yAxis(1,i) = C * (double((expm(t * A) * X0) ...
                   + (int(expm((t - tau) * A) * B * U, tau, 0, t))));
    i    = i + 1;           % inc run variable
end

figure;                                 % open new window
plot(xAxis, yAxis);                     % plot function over t
hold on                                 % hold on
xlabel(['t (', num2str(tStep), ')']);   % define xlabel
ylabel('y');                            % define yLabel
legend('Serial resonance cycle');   
% ------------------------- END RUN ------------------------------------ 