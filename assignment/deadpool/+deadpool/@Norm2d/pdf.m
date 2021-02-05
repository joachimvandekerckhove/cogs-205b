function dF = pdf(obj,xax)
    % Evaluate the 2-Dimentional Multivariate Normal Density at the points xax

% Validate properties of the point xax
check_xax(xax)

% Number of 2d points to evaluate
    npoints = size(xax,2);

% xax is 2xN, reformat obj.Mean to the same size
    krnl = exp(-0.5*((xax - repmat(obj.Mean, [1, npoints])).' * ...
        obj.Precision * (xax - repmat(obj.Mean, [1, npoints]))));
    dF = obj.scalingConstant * obj.invsqrtdet * krnl; % output is NxN (need only the diag for Nx1)
    dF = diag(dF).';

end