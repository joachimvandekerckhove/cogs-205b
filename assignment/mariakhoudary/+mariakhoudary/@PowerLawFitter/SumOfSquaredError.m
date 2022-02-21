function SSE = SumOfSquaredError(A, B, E, beta)

% SUMOFSQUAREDERROR returns the sum of squared errors between ObservedRT
% and ExpectedRT (ERT) 

ERT = obj.Expectation(A, B, E, beta);

SSE = sum((ERT - obj.ObservedRT).^2);