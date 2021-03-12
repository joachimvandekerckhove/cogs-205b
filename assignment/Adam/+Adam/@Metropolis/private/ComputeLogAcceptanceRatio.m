function ComputeLogAcceptanceRatio(obj)

% Computes the logarithm of the acceptance ratio for a Metropolis step

obj.logAcceptanceRatio=obj.ProposedPointY-obj.CurrentPointY;
            
end