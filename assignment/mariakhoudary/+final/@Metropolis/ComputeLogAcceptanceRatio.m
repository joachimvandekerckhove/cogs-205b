function ComputeLogAcceptanceRatio(obj)

% Computes the logarithm of the acceptance ratio for a Metropolis step

obj.LogAcceptanceRatio = log(obj.TargetLogPdf(obj.ProposedPointX)) - log(obj.TargetLogPdf(obj.CurrentPointX));

end