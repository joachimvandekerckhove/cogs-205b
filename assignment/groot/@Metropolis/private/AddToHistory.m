function AddToHistory(obj)

% Adds the current point to the history of points XHistory, and adds the
% current function value to the history of function values YHistory
    % assuming obj.CurrentPointX is size 1xN
    % each col represents a new PointX
    obj.XHistory = [obj.XHistory; obj.CurrentPointX'];
    obj.YHistory = [obj.YHistory; obj.CurrentPointY];

end