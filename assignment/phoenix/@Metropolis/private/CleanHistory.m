function [X, Y, I] = CleanHistory(obj)

% Returns X, the matrix of sampled points without the burnin; Y, the vector
% of corresponding function values; and I, the vector of indices that
% belong to the retained points.

	X = obj.XHistory( (obj.BurnIn + 1):length(obj.XHistory),:);
	Y = obj.YHistory((obj.BurnIn + 1):length(obj.YHistory));
	I = (obj.BurnIn + 1):length(obj.XHistory);
            
end

