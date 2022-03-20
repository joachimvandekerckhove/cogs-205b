function yax = logcdf(obj,X)

    yax = log(mvncdf(X', obj.Mean', obj.Covariance)');

end

