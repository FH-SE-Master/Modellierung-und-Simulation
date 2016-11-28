function solution = initialize(solution)
% Initializes the solution object

% First Thrust
solution.start1 = rand * 100;
solution.end1 = rand * 100;
% Ensure that end is after start
while solution.end1 >= solution.start1
    solution.end1 = rand * 100;
end
% Second Thrust
solution.start2 = rand * 100;
solution.end2 = rand * 100;
% Ensure that end is after start
while solution.end2 >= solution.start2
    solution.end2 = rand * 100;
end

solution.quality          = [];
solution.heightPRogress   = [];
solution.velocityProgress = [];

end

