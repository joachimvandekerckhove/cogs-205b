function AddToHistory(obj)

% Adds the current point to the history of points XHistory, and adds the
% current function value to the history of function values YHistory

obj.XHistory=[obj.XHistory obj.CurrentPointX];
obj.YHistory=[obj.YHistory obj.CurrentPointY];
obj.StepCount=[obj.StepCount obj.StepCount+1];

end