function out = logcdf(obj, X)
    try
        out = log(mvncdf(X, obj.Mean, obj.Covariance));
    catch
        error('wrong input')
    end
end