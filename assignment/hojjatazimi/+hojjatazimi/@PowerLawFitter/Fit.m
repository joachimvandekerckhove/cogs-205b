function Fit(obj)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

if obj.fit 
disp('The model is already fit')
else
x0 = [50, 200, 0, 0];


fun = @(x) SumOfSquaredError(obj, x(1), x(2), x(3), x(4));

x = fminsearch(fun,x0);

obj.EstimatedAsymptote = x(1);
obj.EstimatedRange = x(2);
obj.EstimatedExposure = x(3);
obj.EstimatedRate = x(4);

obj.fit = true;

plot(obj.ObservedRT, '*-');hold on;
plot(obj.Expectation(x(1), x(2), x(3), x(4)), 's-');

legend('Observed Data', 'Estimated Data')

end
end