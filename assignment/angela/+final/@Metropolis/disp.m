function disp(obj)

% This should at a minimum output (a) whether parameters have been estimated and
% (b) the mean and standard deviation of each parameter if they have been estimated.

%     error('Not yet implemented')


if size(obj.XHistory,2) > 1
    fprintf('\nHello!')
    
    % calculate summary statistics
    [CleanSampleX, ~, ~] = CleanHistory(obj);
    CleanSampleX = CleanSampleX';
    mean_estimates = mean(CleanSampleX);
    sd_estimates = std(CleanSampleX);
    
    % print
    for ii = 1:length(mean_estimates)
        fprintf('\n\tParameter %i: mean = %.2f, sd = %.2f',ii,mean_estimates(ii),sd_estimates(ii)),
    end
    fprintf('\nDone!\n')
        
else
    fprintf('\nHello! I am a Metropolis object.')
    fprintf('\nMy initial values are:')
    for ii = 1:length(obj.InitialValues)
        fprintf('\n\tParameter %i: %.2f',ii,obj.InitialValues(ii))
    end
    fprintf('\nI currently have no parameter estimates.')
    fprintf('\nPlease draw samples to estimate parameters.\n')
end

end
