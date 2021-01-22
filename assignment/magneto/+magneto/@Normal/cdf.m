% Cumulative distribution function
function yax = cdf(obj, xax)

zax = obj.standardize(xax);
yax = 0.5 * (1 + erf(zax ./ sqrt(2)));

end
