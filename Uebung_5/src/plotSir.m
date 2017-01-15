function plotSir(res, prefix, time, N, alpha, beta, mu)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

    % plot each result of a in own window
    figure;
    hold on;
    
    title(strcat(prefix, strcat('N=', strcat(N, strcat(', alpha=', strcat(alpha, strcat(', beta=', strcat(beta, strcat(', mu=', mu)))))))));
    plot(time, [res.iProg res.sProg res.rProg]);
    xlabel('time')
    legend('I_t', 'S_t', 'R_t');
    
    hold off;

end

