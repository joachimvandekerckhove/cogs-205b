% Log Probability density function
function logf = logpdf(obj, x)
    logf = obj.logScaleFactor + logkernel(obj,x);
end