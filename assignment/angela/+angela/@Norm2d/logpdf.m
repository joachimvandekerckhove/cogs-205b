function yax = logpdf(obj,X)

    sigma1 = sqrt(obj.Covariance(1)); sigma2 = sqrt(obj.Covariance(4));

    z = obj.standardize(X);
    
    yax = -log(2*pi*sigma1*sigma2) - 0.5*log(1-obj.Correlation^2) ...
              - obj.expTerm(z);    

end
