function disp(obj)

% This should at a minimum output (a) whether parameters have been estimated and
% (b) the mean and standard deviation of each parameter if they have been estimated.

    if size(obj.XHistory, 2) == 1
        fprintf('Metropolis algorithm not yet ran. Use DrawProposal to do so!\n')
    else
        [CleanSampleX, ~, ~] = CleanHistory(obj);
        fprintf('Estimated Parameters from Metropolis Algorithm:\n')
        
        meanOfParameters = mean(CleanSampleX, 2);
        fprintf('Estimated Mean:\n')
        for i = 1:size(CleanSampleX, 1)
            fprintf('\t%0.3f', meanOfParameters(i));
        end
            fprintf('\n')
            
        stdDevOfParameters = std(CleanSampleX, 0, 2);
        fprintf('Estimated Std Dev:\n')
        for i = 1:size(CleanSampleX, 1)
            fprintf('\t%0.3f', stdDevOfParameters(i));
        end
            fprintf('\n')
        
    end
    
end