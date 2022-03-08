% Computes the logarithm of the acceptance ratio for a Metropolis step
function ComputeLogAcceptanceRatio(obj)
     % log(ratio) = log(dividend) - log(divisor)
     % Both the current and the proposed Y points 
     % are computed from the TargetLogPdf.
     obj.LogAcceptanceRatio = obj.ProposedPointY - obj.CurrentPointY;
            
end