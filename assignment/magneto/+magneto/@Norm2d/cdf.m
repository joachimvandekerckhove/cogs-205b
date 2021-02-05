% Cumulative distribution function
function p = cdf(obj, xax)
% Straight outta toolbox.Stats
p = mvncdf(xax', obj.Mean', obj.Covariance)';
end
