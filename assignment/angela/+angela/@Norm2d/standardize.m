function z = standardize(obj, X)

    x1 = X(1,:); x2 = X(2,:);
    mu1 = obj.Mean(1); mu2 = obj.Mean(2);
    sigma1 = sqrt(obj.Covariance(1)); sigma2 = sqrt(obj.Covariance(4));
    rho = obj.Correlation;

    z = ((x1 - mu1)/sigma1).^2 - (2 * rho * ((x1 - mu1)/sigma1) ...
        .* ((x2 - mu2)/sigma2)) + ((x2 - mu2)/sigma2).^2;
    
end