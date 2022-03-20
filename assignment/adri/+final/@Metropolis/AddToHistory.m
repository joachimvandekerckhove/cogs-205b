% Adds the current point to the history of points XHistory, and adds the
% current function value to the history of function values YHistory.
% After running this, the XHistory property should have a new column that
% contains the most recently accepted sample, and the YHistory property
% should have a new element that contains the corresponding target function
% value.
function AddToHistory(obj)

    % Add the approved Y value to the History vector of Y values
    obj.YHistory = [obj.YHistory, obj.CurrentPointY];
    % Add a new column with the approved X values to the X History matrix
    obj.XHistory = [obj.XHistory, obj.CurrentPointX];           

end