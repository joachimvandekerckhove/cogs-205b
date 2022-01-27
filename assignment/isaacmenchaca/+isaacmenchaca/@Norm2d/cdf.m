function yax = cdf(obj, X)
    %display(size(X)); % unused line of code
    yax = mvncdf(X', obj.Mean', obj.Covariance)';  
end

