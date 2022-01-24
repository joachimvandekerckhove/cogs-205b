function output1 = pdf(obj,X)
    
    sigma1 = obj.Covariance(1); sigma2 = obj.Covariance(4);
    
    z = obj.standardize(X);
    
    
    
    output1 = (1 / (2*pi*sigma1*sigma2*sqrt(1-obj.Correlation))) ...
              * exp(obj.expTerm(z));
    
end
