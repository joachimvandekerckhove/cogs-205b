function ratio = ComputeLogAcceptanceRatio(obj)

% Computes the logarithm of the acceptance ratio for a Metropolis step
ratio = obj.CurrentPointX-obj.ProposedPointX;
obj.LogAcceptanceRatio=ratio;
            error('Not yet implemented')
            
end