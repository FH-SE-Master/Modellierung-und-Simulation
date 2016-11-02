function timertest
 tic 
 x = 1:0.01:100000;
 % for loop slower then "y = sin(x);"
 %y = zeros(1, length(x));
 %for i=1:length(x)
 %    y(i) = sin(x(i));
 %end
 
 y = sin(x);
 toc
end

