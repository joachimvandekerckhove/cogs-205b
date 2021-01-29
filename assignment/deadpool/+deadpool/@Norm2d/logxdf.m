function logFx = logxdf(obj,xax)
    % Compute the logarithm of the cdf od 2d Multivariate Normal
    % xax has to be a matrix of column vectors of size 2xn

% Validate properties of the point xax
% Is xax a matrix of dimentions 2,n?        
    if ~(size(xax,1)==2)
        error('Support must have size of 2.')
    end

% Are the values on xax finite?
    if ~(isfinite(xax))
        error('Support must be a finite value.')
    end

% Are the values on xax real numbers?
    if ~(isreal(xax))
        error('Support must be a real vector.')
    end

% Number of 2d points to evaluate
    npoints = size(xax,2);

% Create a vector to save multiple values of the density of the MVN
    logFx = zeros(npoints,1);

    for i = 1:npoints
% Evaluate density function at point xax
        logFx(i) = log(mvncdf(xax(:,i),obj.Mean,obj.CovM))
    end   
end