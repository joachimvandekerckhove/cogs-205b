function yax = cdf(obj,X)

    if size(X,2) ~= size(obj.Mean,1)
        X = X';
    end
    
    yax = mvncdf(X, obj.Mean', obj.Covariance);
    
    yax = yax';

end
