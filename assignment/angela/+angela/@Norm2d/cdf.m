function output3 = cdf(obj,X)

    output3 = mvncdf(X, obj.Mean, obj.Covariance);

end
