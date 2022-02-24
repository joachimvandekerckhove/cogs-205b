function Fit(obj)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

if obj.fit 
disp('The model is already fit')
else
x0 = [50, 200, 0, 0];


fun = @(x) SumOfSquaredError(obj, x(1), x(2), x(3), x(4));

x = fminsearch(fun,x0);

disp(x);

plot(obj.ObservedRT, '*-');hold on;
plot(obj.Expectation(x(1), x(2), x(3), x(4)), 's-');

legend('Observed Data', 'Estimated Data')
obj.fit = true;
end
end