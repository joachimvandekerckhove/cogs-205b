% Cumulative distribution function

function outputArg = cdf(obj, xax)
outputArg = mvncdf(xax', obj.Mean', obj.Covariance)';
end
