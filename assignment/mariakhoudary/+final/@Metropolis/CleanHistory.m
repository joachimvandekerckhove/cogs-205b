function [CleanSampleX, CleanSampleY, CleanIndex] = CleanHistory(obj)

% Returns CleanSampleX, the matrix of sampled points without the burnin;
% CleanSampleY, the vector of corresponding function values; and
% CleanIndex, the vector of indices that belong to the retained points. 

CleanSampleX = obj.XHistory(obj.BurnIn+1:end);
CleanSampleY = obj.YHistory(obj.BurnIn+1:end);
CleanIndex = intersect(obj.XHistory, CleanSampleX, 'stable');

end

