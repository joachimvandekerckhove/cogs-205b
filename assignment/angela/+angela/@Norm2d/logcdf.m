function output4 = logcdf(obj,X)

    output4 = log(mvtcdf(X, obj.Mean, obj.Covariance));

end

