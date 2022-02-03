function yax = logcdf(obj, xax)

    % LOGCDF    log cumulative distribution function
    yax = log(obj.cdf(xax));
       
end