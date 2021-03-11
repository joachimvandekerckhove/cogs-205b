function ComputeLogAcceptanceRatio()
%ComputeLogAcceptanceRatio - ln of acceptance ratio

    % Calculate the ln of the ratio between the densities at previous and current point
    obj.LogAccept = obj.PointY - obj.YHistory(obj.StepCount)
end