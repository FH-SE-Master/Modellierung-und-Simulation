function X = calculateDifferential(A, B, C, U, X0, tStart, tEnd, tStep)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% ------------------------- BEGIN Prepare -------------------------------
if (nargin == 6)             % Set default for steps if not given
    tStep = 0.01;
end
% ------------------------- END Prepare ---------------------------------

% ------------------------- BEGIN Validation ----------------------------
if(nargin < 6)                        % Validate parameter count
    error('At least A, bMatrix, uMatrix, x0Matrix, xMatrix, tStart and tEndmust be given');
elseif(tStart > tEnd)                 % Range check
    error('tStart must not overflow tEnd');
elseif((tStep >= 1) || (tStep <= 0))  % Range check
    error('tStep must be ''0 < tStep < 1''');
end
% ------------------------- END Validation ------------------------------

syms tau;
i = 1;
xAxis = tStart:tStep:tEnd;
yAxis = zeros(1, int8((tEnd - tStart) / tStep));
for t=tStart:tStep:tEnd
    result     = double((expm(t * A) * X0) + (int(expm((t - tau) * A) * B * U, tau, 0, t)));
    yAxis(1,i) = C * result;
    i    = i + 1;
end

figure;                                 % open new window
plot(xAxis, yAxis);                             % plot function over t
hold on                                 % hold on
xlabel(['t (', num2str(tStep), ')']);   % define xlabel
ylabel('y');                            % define yLabel
legend('legend') % define legend

end

