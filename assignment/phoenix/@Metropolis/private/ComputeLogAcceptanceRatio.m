function ComputeLogAcceptanceRatio(obj)

% Computes the logarithm of the acceptance ratio for a Metropolis step

	obj.logAcceptRatio = obj.ProposedPointY - obj.CurrentPointY;
            
end
