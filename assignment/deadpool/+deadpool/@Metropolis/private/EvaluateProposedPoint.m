function EvaluateProposedPoint()
%EvaluateProposedPoint - TargetLogPdf at proposed point

    % Calculate the density at the current point in X
    obj.PointY = obj.TargetLogPdf(obj.PointX)    
end