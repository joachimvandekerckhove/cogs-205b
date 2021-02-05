function logFx = logcdf(obj,xax)
    % Compute the logarithm of the cdf od 2d Multivariate Normal
    % xax has to be a matrix of column vectors of size 2xn

% Validate properties of the point xax
% Check xax is a real number 
if ~(isnumeric(xax) & isfinite(xax) & isreal(xax))
    error('Support must be a real finite value')
end
% Is xax a matrix of dimentions 2xn or nx2?        
if ~(size(xax,1)==2)
    error('Support must have size of 2.')
end

% Evaluate density function
    logFx = mvncdf(xax.', obj.Mean.', obj.Covariance); 
    logFx = logFx.' ;
end