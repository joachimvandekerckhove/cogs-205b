function loglik = logpdf(obj, xax)
    % Evaluate the natural log of the 2-Dimentional Multivariate Normal Density at the points xax

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

% Create a vector to save multiple values of the kernel for the MVN
    logkrnl = zeros(npoints,1);

% Create a vector to save multiple values of the density of the MVN
    loglik = zeros(npoints,1);

    for i = 1:npoints
% Evaluate the kernel at point xax
        logkrnl(i) = -0.5*((xax(:,i) - obj.Mean).' * obj.Precision * (xax(:,i) - obj.Mean));
% Evaluate density function at point xax
        loglik(i) = log(obj.scalingConstant) + obj.loginvsqrtdet + logkrnl(i);
    end
    loglik = loglik.' ;
end