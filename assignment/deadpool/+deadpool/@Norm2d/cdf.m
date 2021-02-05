function Fx = cdf(obj,xax)
    % Compute the probability that the vector x is <= to xax
    % xax has to be a matrix of column vectors of size 2xn

% Validate properties of the point xax
% Check xax is a real number 
    if ~(isnumeric(xax) & isfinite(xax) & isreal(xax))
        error('Support must be a real finite value')
    end
% Is xax a matrix of dimentions 2,n?        
    if ~(size(xax,1)==2)
        error('Support must have size of 2.')
    end

% Evaluate density function at point xax
    Fx = mvncdf(xax.', obj.Mean.', obj.Covariance); 
    Fx = Fx.' ;
end