function ComputeLogAcceptanceRatio(obj)

% Computes the logarithm of the acceptance ratio for a Metropolis step
% Defined as the probability of the proposed point over the probability of
% the current point
%             error('Not yet implemented')

%     obj.LogAcceptanceRatio = log(obj.ProposedPointY / obj.CurrentPointY);
% This is based on log(x), so log(y1) - log(y2) = y1/y2?
    obj.LogAcceptanceRatio = min(obj.ProposedPointY - obj.CurrentPointY, 0);
end