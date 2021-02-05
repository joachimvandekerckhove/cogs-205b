function dF = pdf(obj,xax)
    % Evaluate the 2-Dimentional Multivariate Normal Density at the points xax

% Validate properties of the point xax
check_xax(xax)

% Number of 2d points to evaluate
    npoints = size(xax,2);

% Create a vector to save multiple values of the kernel for the MVN
    krnl = zeros(npoints,1);

% Create a vector to save multiple values of the density of the MVN
    dF = zeros(npoints,1);

    for i = 1:npoints
% Evaluate the kernel at point xax
        krnl(i) = exp(-0.5*((xax(:,i) - obj.Mean).' * obj.Precision * (xax(:,i) - obj.Mean)));
% Evaluate density function at point xax
        dF(i) = obj.scalingConstant * obj.invsqrtdet * krnl(i);
    end
    dF = dF.' ;
end