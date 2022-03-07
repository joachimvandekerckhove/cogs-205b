function EvaluateCurrentPoint(obj)

% Computes the target function at the current point X and stores the result
% in current point Y.
obj.ProposedPointY=obj.TargetLogPdf(obj.ProposedPointX);

            
end 