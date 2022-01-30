% Deviance function

function outputArg = deviance(obj, xax)
outputArg = -2 * sum(obj.logpdf(xax));
end