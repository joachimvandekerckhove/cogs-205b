function AddToHistory(obj)

% Adds the current point to the history of points XHistory, and adds the
% current function value to the history of function values YHistory

    % Set history vectors to be vertical, not horizontal
    obj.XHistory = [obj.XHistory;reshape(obj.CurrentPointX,[1,2])];
    obj.YHistory = [obj.YHistory;obj.CurrentPointY];

end