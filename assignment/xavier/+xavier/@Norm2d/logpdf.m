% Log probability density function

function outputArg = logpdf(obj, xax)
outputArg = obj.logScaleFactor + logkernel(obj, xax);
end
