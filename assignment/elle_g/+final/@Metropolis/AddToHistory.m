function AddToHistory(obj)

% Adds the current point to the history of points XHistory, 
obj.XHistory=[obj.XHistory, obj.CurrentPointX];

% and adds the current function value to the history of function values YHistory.
obj.YHistory=[obj.YHistory, obj.CurrentPointY];

% After running this, the XHistory property should have a new column that
% contains the most recently accepted sample, and the YHistory property
% should have a new element that contains the corresponding target function
% value.

end