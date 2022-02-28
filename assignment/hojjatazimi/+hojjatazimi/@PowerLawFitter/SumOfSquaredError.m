function SSE = SumOfSquaredError(obj, A, B, E, b)
%SUMOFSQUAREDERROR Summary of this function goes here
%   Detailed explanation goes here
ERT = Expectation(obj, A, B, E, b);
Err = ERT - obj.ObservedRT;
Err_power = power(Err, 2);
SSE = sum(Err_power);
end

