% Cumulative distribution function

function lp = logcdf(obj, xax)
lp = log(obj.cdf(xax));
end