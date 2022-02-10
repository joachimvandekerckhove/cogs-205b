% Probability density function
function fx = pdf(obj, x)
    fx= obj.ScaleFactor * exp(logkernel(obj,x));
end