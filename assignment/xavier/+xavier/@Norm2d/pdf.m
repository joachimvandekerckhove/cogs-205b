% Probability density function

function outputArg = pdf(obj, xax)
outputArg = obj.ScaleFactor * exp(logkernel(obj, xax));
end
