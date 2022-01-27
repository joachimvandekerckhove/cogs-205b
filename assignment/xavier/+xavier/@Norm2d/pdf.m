% Probability density function

function d = pdf(obj, xax)
% Exponentiate the logkernel and multiply scale factor
k = exp(logkernel(obj, xax));
d = obj.ScaleFactor * k;
end