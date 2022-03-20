function disp(obj)

if isempty(obj.XHistory)
    fprintf('Nothing in the history. \n');
elseif size(obj.XHistory,2)==1
    fprintf('Initial values set. Run DrawSamples. \n');
else % after DrawSamples is run
    [CleanSampleX,~,~] = CleanHistory(obj);
    CleanSampleX_T = CleanSampleX';
    
    estimate = mean(CleanSampleX_T);
    post_std = std(CleanSampleX_T);
    
    switch size(CleanSampleX_T,2) % number of parameters
        case 4 % Constrained
            fprintf(' Constrained\n> estimate:  [betaA0 betaA1 betaB0 betaB1]\n (%.1f, %.1f, %.1f, %.1f) +/- (%.2f, %.2f, %.2f, %.2f)\n\n', ...
                estimate, post_std)
        case 6 % Saturated
            fprintf(' Saturated\n > estimate:  [Ae Am Ah Be Bm Bh]\n(%.1f, %.1f, %.1f, %.1f, %.1f, %.1f) +/- (%.2f, %.2f, %.2f, %.2f, %.2f, %.2f)\n\n', ...
                estimate, post_std)
        otherwise
            error('wrong number of parameters.')
    end

end
