function SSE = SumOfSquaredError(obj, A, B, E, b)
%SUMOFSQUAREDERROR Summary of this function goes here
%   Detailed explanation goes here
ERT = Expectation(obj, A, B, E, b);
Err = ERT - obj.ObservedRT;
SSE = power(Err, 2);
end

