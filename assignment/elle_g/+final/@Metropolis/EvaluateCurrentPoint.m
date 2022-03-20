function EvaluateCurrentPoint(obj)

% Computes the target function at the current point X and stores the result
% in current point Y.
obj.CurrentPointY=obj.TargetLogPdf(obj.CurrentPointX);

            
end 