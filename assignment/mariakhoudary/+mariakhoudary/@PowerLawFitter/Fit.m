function Fit(obj)

% FIT uses Nelder-Mead optimization to fit the Power Law to ObservedRT

% goal: find values of the input (parameters) that optimize an output
% in this case, we want to minimize SSE

% create anonymous function to be minimized
objective = @(parameters) obj.SumOfSquaredError(parameters);

% define initial values for parameters
A0 = 300;
B0 = 100;
E0 = 5;
Beta0 = 1;

% minimize it
estimates = fminsearch(objective, [A0, B0, E0, Beta0], ...
                                                        optimset('MaxFunEvals', 1e6, 'MaxIter', 1e6));

% update object properties to fitted values
obj.EstimatedAsymptote = estimates(1);
obj.EstimatedRange = estimates(2);
obj.EstimatedExposure = estimates(3);
obj.EstimatedRate = estimates(4);

end