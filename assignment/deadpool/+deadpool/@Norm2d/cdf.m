function Fx = cdf(obj,xax)
    % Compute the probability that the vector x is <= to xax
    % xax has to be a matrix of column vectors of size 2xn

% Validate properties of the point xax
check_xax(xax)

% Evaluate density function at point xax
    Fx = mvncdf(xax.', obj.Mean.', obj.Covariance); 
    Fx = Fx.' ;
end