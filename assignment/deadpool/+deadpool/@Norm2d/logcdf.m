function logFx = logcdf(obj,xax)
    % Compute the logarithm of the cdf od 2d Multivariate Normal
    % xax has to be a matrix of column vectors of size 2xn

% Validate properties of the point xax
check_xax(xax)

% Evaluate density function
    logFx = mvncdf(xax.', obj.Mean.', obj.Covariance); 
    logFx = logFx.' ;
end