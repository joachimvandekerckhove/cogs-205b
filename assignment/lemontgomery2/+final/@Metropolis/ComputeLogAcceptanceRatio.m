function ComputeLogAcceptanceRatio(obj)

% Computes the logarithm of the acceptance ratio for a Metropolis step

    obj.LogAcceptanceRatio = obj.TargetLogPdf(obj.ProposedPointX) - obj.TargetLogPdf(obj.CurrentPointX);
            
end