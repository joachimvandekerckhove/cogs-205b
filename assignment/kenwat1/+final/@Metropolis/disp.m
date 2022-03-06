function disp(obj)

if isempty(obj.XHistory)
    fprintf('Nothing in the history. \n');
elseif size(obj.XHistory,2)==1
    fprintf('Initial values set. Run DrawSamples. \n');
else % after DrawSamples is run
    [CleanSampleX,~,~] = CleanHistory(obj);
    CleanSampleX_T = CleanSampleX';
    
    estimate = mean(CleanSampleX_T,1);
    post_std = std(CleanSampleX_T,1);
    
    switch size(CleanSampleX_T,2) % number of parameters
        case 4 % Constrained
            fprintf(' > estimate:  (%.1f, %.1f, %.1f, %.1f) +/- (%.2f, %.2f, %.2f, %.2f)\n', estimate, post_std)
        case 6 % Saturated
            fprintf(' > estimate:  (%.1f, %.1f, %.1f, %.1f, %.1f, %.1f) +/- (%.2f, %.2f, %.2f, %.2f, %.2f, %.2f)\n', ...
                estimate, post_std)
        otherwise
            error('wrong number of parameters.')
    end

end
