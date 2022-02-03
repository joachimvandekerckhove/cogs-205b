function yax = cdf(obj, xax)

    % CDF    Cumulative distribution function
    tempyax = mvncdf(xax', obj.Mean', obj.Covariance');
    yax = tempyax';

end