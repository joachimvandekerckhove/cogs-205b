function out = cdf(obj, X)
    try
        out = mvncdf(X, obj.Mean', obj.Covariance)';
    catch
        out = mvncdf(X', obj.Mean', obj.Covariance)';
    end
end