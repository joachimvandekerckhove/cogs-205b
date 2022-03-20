% Computes the target function at the current point X 
% and stores the result in current point Y.
function EvaluateCurrentPoint(obj)

    obj.CurrentPointY = obj.TargetLogPdf(obj.CurrentPointX);
            
end 