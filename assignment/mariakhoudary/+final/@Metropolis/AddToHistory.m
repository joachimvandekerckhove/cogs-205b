function AddToHistory(obj)

% Adds the current point to the history of points XHistory, and adds the
% current function value to the history of function values YHistory.
% After running this, the XHistory property should have a new column that
% contains the most recently accepted sample, and the YHistory property
% should have a new element that contains the corresponding target function
% value.

obj.XHistory(:, R) = obj.CurrentPointX;

obj.YHistory(end + 1) = obj.CurrentPointY;

end