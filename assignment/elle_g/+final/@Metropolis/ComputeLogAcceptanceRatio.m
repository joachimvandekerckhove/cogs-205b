function ComputeLogAcceptanceRatio(obj)

% Computes the logarithm of the acceptance ratio for a Metropolis step
obj.LogAcceptanceRatio = obj.CurrentPointX-obj.ProposedPointX;
            
end