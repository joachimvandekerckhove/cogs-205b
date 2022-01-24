function output3 = cdf(obj,X)

    if size(X,2) ~= size(obj.Mean,1)
        X = X';
    end
    
    output3 = mvncdf(X, obj.Mean', obj.Covariance);
    
    output3 = output3';

end
