% Log cumulative distribution function

function outputArg = logcdf(obj, xax)
outputArg = log(obj.cdf(xax));
end
