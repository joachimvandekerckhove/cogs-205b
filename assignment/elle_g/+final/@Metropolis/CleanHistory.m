function [CleanSampleX, CleanSampleY, CleanIndex] = CleanHistory(obj)

% Returns CleanSampleX, the matrix of sampled points without the burnin;
CleanSampleX = obj.XHistory(:, obj.BurnIn+1:end);

% CleanSampleY, the vector of corresponding function values; 
CleanSampleY = obj.YHistory(:, obj.BurnIn+1:end);

% CleanIndex, the vector of indices that belong to the retained points. 
CleanIndex = obj.BurnIn+1:length(obj.YHistory);
            
end

