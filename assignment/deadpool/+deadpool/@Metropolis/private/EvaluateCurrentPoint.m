function EvaluateCurrentPoint(point)
% EvaluateCurrentPoint - targetlogpdf at x

    % Compute the ln of the posterior distribution at current point.
    obj.PointY(:,1) = obj.TargetLogPdf(point(:,1));
end