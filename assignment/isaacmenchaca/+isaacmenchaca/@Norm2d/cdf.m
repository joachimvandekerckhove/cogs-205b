function yax = cdf(obj, X)
    %display(size(X));
    yax = mvncdf(X', obj.Mean', obj.Covariance)';  
end

