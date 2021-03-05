function ComputeLogAcceptanceRatio(obj)

% Computes the logarithm of the acceptance ratio for a Metropolis step
% Defined as the probability of the proposed point over the probability of
% the current point
%             error('Not yet implemented')

    obj.LogAcceptanceRatio = log(obj.ProposedPointY / obj.CurrentPointY);
end