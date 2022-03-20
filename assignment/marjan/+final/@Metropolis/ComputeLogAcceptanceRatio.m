function ComputeLogAcceptanceRatio(obj)

% Computes the logarithm of the acceptance ratio for a Metropolis step

            %error('Not yet implemented')
 obj.LogAcceptanceRatio=obj.ProposedPointY-obj.CurrentPointY;
end