function yax = cdf(obj, xax)

    % CDF    cumulative distribution function
    tempyax = mvncdf(xax', obj.Mean', obj.Covariance');
    yax = tempyax';

end