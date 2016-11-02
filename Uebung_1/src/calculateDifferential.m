function X = calculateDifferential(aMatrix, bMatrix, uMatrix, x0Matrix, tStart, tEnd, tStep)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% ------------------------- BEGIN Prepare -------------------------------
if (nargin == 6)             % Set default for steps if not given
    tStep = 0.01;
end
% ------------------------- END Prepare ---------------------------------

% ------------------------- BEGIN Validation ----------------------------
if(nargin < 6)                        % Validate parameter count
    error('At least aMatrix, bMatrix, uMatrix, x0Matrix, xMatrix, tStart and tEndmust be given');
elseif(tStart > tEnd)                 % Range check
    error('tStart must not overflow tEnd');
elseif((tStep >= 1) || (tStep <= 0))  % Range check
    error('tStep must be ''0 < tStep < 1''');
end
% ------------------------- END Validation ------------------------------

i = 0;
X = zeros(1, int8((tEnd - tStart) / tStep));
for t=tStart:tStep:tEnd
    i    = i + 1;
end
end

