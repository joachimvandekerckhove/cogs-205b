function AddToHistory(obj)
%AddToHystory - adds point X and PointY to history

    % Add current point to the history of X and Y
    obj.XHistory( : , obj.StepCount+1) = obj.PointX;
    obj.YHistory(obj.StepCount+1)      = obj.PointY;

    % Add one to iteration counter
    obj.StepCount = obj.StepCount + 1;
end