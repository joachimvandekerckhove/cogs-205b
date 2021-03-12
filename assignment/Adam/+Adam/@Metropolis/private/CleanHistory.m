function [X, Y, I] = CleanHistory(obj)

% Returns X, the matrix of sampled points without the burnin; Y, the vector
% of corresponding function values; and I, the vector of indices that
% belong to the retained points.

X=obj.XHistory(obj.burnin+1:end);
Y=obj.YHistory(obj.burnin+1:end);
I=obj.StepCount(obj.burnin+1:end);
            
end

