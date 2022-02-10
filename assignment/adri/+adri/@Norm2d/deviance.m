% Deviance score function
function dev = deviance(obj, x)            
    dev = - 2 * sum(obj.logpdf(x));
end