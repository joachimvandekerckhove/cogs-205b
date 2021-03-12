function ComputeLogAcceptanceRatio(obj)

% Computes the logarithm of the acceptance ratio for a Metropolis step

    obj.LogAcceptRatio = obj.ProposedPointY - obj.CurrentPointY;

end