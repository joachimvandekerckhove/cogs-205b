% Deviance function

function dev = deviance(obj, xax)
dev = -2 * sum(obj.logpdf(xax));
end