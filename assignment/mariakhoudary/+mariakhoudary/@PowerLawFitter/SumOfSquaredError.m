function SSE = SumOfSquaredError(obj, parameters)

% SUMOFSQUAREDERROR returns the sum of squared errors between ObservedRT
% and ExpectedRT (ERT) 

ERT = obj.Expectation(parameters);
SSE = sum((ERT - obj.ObservedRT).^2);

end