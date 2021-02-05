% Probability density function

function ld = logpdf(obj, xax)
% Get the logkernel and add logscale factor
k = logkernel(obj, xax);
ld = obj.logScaleFactor + k;
end