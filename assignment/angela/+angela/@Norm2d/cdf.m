function yax = cdf(obj,X)
   
    yax = mvncdf(X, obj.Mean', obj.Covariance);
    
    yax = yax';

end
