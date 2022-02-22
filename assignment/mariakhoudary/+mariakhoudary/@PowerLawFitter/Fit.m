function Fit(obj)

% FIT uses Nelder-Mead optimization to fit the Power Law to ObservedRT

% goal: find values of the input (parameters) that optimize an output
% in this case, we want to minimize SSE

% create anonymous function to be minimized
objective = @(parameters) obj.SumOfSquaredError(parameters);

% minimize it
estimates = fminsearch(objective, [obj.EstimatedAsymptote, ...
                                                  obj.EstimatedRange, ...
                                                  obj.EstimatedExposure, ...
                                                  obj.EstimatedRate], ...
                                                        optimset('MaxFunEvals', 1e6, 'MaxIter', 1e6));

% update object properties to fitted values
obj.EstimatedAsymptote = estimates(1);
obj.EstimatedRange = estimates(2);
obj.EstimatedExposure = estimates(3);
obj.EstimatedRate = estimates(4);

end