function yax = logcdf(obj,X)

    yax = log(mvtcdf(X, obj.Mean, obj.Covariance));

end

