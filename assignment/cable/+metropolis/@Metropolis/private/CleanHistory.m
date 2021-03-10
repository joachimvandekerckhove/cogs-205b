function [X, Y, I] = CleanHistory(obj)

% Returns X, the matrix of sampled points without the burnin; Y, the vector
% of corresponding function values; and I, the vector of indices that
% belong to the retained points.

%             error('Not yet implemented')
            X = obj.XHistory(:,obj.BurnIn+1:end);
                X = reshape(X,[obj.numSamples-obj.BurnIn obj.XDim]);
            Y = obj.YHistory(:,obj.BurnIn+1:end);
                Y = reshape(Y,[obj.numSamples-obj.BurnIn 1]);
            I = (obj.BurnIn+1):length(obj.XHistory);
                I = reshape(I,[obj.numSamples-obj.BurnIn 1]);
            
end

