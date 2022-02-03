function yax = logcdf(obj, xax)

    % LOGCDF    Log cumulative distribution function
    yax = log(obj.cdf(xax));
       
end