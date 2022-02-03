function z = standardized(obj, X)
        
    x1 = (X(1,:));
    x2 = (X(2,:));

    mu1 = obj.Mean(1);
    mu2 = obj.Mean(2);

    
    z = ((x1 - mu1) / obj.sigma1) .^ 2 ...
         - 2 * obj.Correlation * ((x1 - mu1) / obj.sigma1) .* ((x2 - mu2) / obj.sigma2) ...
            + ((x2 - mu2) / obj.sigma2) .^ 2;
end