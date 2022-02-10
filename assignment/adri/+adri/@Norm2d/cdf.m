% Cumulative distribution function
function Fx = cdf(obj, x)            
    Fx = mvncdf(x', obj.Mean.', obj.Covariance)';
end