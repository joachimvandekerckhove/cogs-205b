function dF = pdf(obj,xax)
    % Evaluate the 2-Dimentional Multivariate Normal Density at the points xax

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

% Get the determinant of the Covariance matrix
    detertminant = det(obj.CovM);

% Get inverse square root of the determinant of Covariance matrix
    invsqrtdet = (detertminant).^(-0.5);

% Create a vector to save multiple values of the kernel for the MVN
    krnl = zeros(npoints,1);

% Create a vector to save multiple values of the density of the MVN
    dF = zeros(npoints,1);

    for i = 1:npoints
% Evaluate the kernel at point xax
        krnl(i) = exp(-0.5*((xax(:,i) - obj.Mean).' * obj.PrecisionM * (xax(:,i) - obj.Mean)));

% Evaluate density function at point xax
        dF(i) = obj.scalingconstant*invsqrtdet*krnl(i);
    end
end