% log of the 2D-Normal kernel
function kern = logkernel(obj, x)
    obj.isValidSupport(x);
    stand = (x - obj.Mean) ./ sqrt(diag(obj.Covariance));
    z = sum(stand.^2, 1) - 2 * obj.Correlation * prod(stand, 1);
    kern = -0.5 ./ (1 - obj.Correlation^2) * z;
end