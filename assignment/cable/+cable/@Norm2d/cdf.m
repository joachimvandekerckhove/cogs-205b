function cdfOut = cdf(obj,X)
    % freebie
    cdfOut = mvncdf(X,obj.Mean,obj.Covariance);
end
