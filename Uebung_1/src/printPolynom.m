function printPolynom(poly, tStart, tEnd, tStep)
% This function calculates the polynom and plots it
% x-axis: tStart:[tStep,0.01]:tEnd
% y-axis: polyval(poly, currentStep)

% ------------------------- BEGIN Prepare -------------------------------
polySize = size(poly);       % get dimensions of matrix
if (nargin == 3)             % Set default for steps if not given
    tStep = 0.01;
end
% ------------------------- END Prepare ---------------------------------

% ------------------------- BEGIN Validation ----------------------------
if(nargin < 3)                        % Validate parameter count
    error('At least line vector, tStart and tEnd must be given');
elseif(polySize(1) ~= 1)              % Validate for line vector
    error('Only line vectors are allowed');
elseif(tStart > tEnd)                 % Range check
    error('tStart must not overflow tEnd');
elseif((tStep >= 1) || (tStep <= 0))  % Range check
    error('tStep must be ''0 < tStep < 1''');
end
% ------------------------- END Validation ------------------------------

% ------------------------- BEGIN Logic ---------------------------------
stepCount = int8((tEnd - tStart) / tStep);
x    = zeros(1, stepCount);            % pre-allocate x
y    = zeros(1, stepCount);            % pre-allocate y
idx  = 1;                              % counter valriable
cols = polySize(2);
for t=tStart:tStep:tEnd                % loop over range
    x(idx) = t;                        % build x-axis
    yValue = 0;
    for i=1:1:cols                     % calculate polynom
        yValue = yValue + poly(1, i) * t^(cols - i);
    end
    y(idx) = yValue;                    % build y-axis
    idx    = idx + 1;                   % increase counter
end

figure;                                 % open new window
plot(x, y);                             % plot function over t
hold on                                 % hold on
xlabel(['t (', num2str(tStep), ')']);   % define xlabel
ylabel('y');                            % define yLabel
legend(strcat('y(t)=', poly2Str(poly))) % define legend
% ------------------------- END Logic -----------------------------------
end

