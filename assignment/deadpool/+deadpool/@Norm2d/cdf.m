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

% Number of 2d points to evaluate
    npoints = size(xax,2);

% Create a vector to save multiple values of the density of the MVN
    Fx = zeros(npoints,1);

    for i = 1:npoints
% Evaluate density function at point xax
        Fx(i) = mvncdf(xax(:,i),obj.Mean,obj.Covariance);
    end
    Fx = Fx.'
end