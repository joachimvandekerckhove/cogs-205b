function [X, Y, I] = CleanHistory(obj)

% Returns X, the matrix of sampled points without the burnin; Y, the vector
% of corresponding function values; and I, the vector of indices that
% belong to the retained points.

%             error('Not yet implemented')
            X = obj.XHistory(obj.BurnIn+1:end,:);
            Y = obj.YHistory(obj.BurnIn+1:end,:);
            I = obj.BurnIn:length(obj.XHistory);
            
end

