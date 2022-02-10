% Log cumulative density function
function logF = logcdf(obj,x)            
    logF = log(obj.cdf(x));
end