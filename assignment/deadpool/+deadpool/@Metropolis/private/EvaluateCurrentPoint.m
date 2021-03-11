function EvaluateCurrentPoint(point)
% EvaluateCurrentPoint - targetlogpdf at x

    % Compute the ln of the posterior distribution at current point.
    obj.PointY = obj.TargetLogPdf(point);
end