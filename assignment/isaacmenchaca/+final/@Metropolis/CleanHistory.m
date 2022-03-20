function [CleanSampleX, CleanSampleY, CleanIndex] = CleanHistory(obj)

% Returns CleanSampleX, the matrix of sampled points without the burnin;
% CleanSampleY, the vector of corresponding function values; and
% CleanIndex, the vector of indices that belong to the retained points. 

% Burn-in is throwing away some iterations at the beginning of an MCMC run.
%  there is an initial transient that is unrepresentative of the equilibrium distribution

    % filter out burnin amount of columns. the column index to start is obj.BurnIn + 1.
    
    CleanIndex = obj.BurnIn + 1:length(obj.YHistory);
    
    CleanSampleX = obj.XHistory(:, CleanIndex); 
    
    CleanSampleY = obj.YHistory(CleanIndex); 
    
    %plot3(CleanSampleX(1, :), CleanSampleX(2, :), CleanSampleY);
end

