function output1 = pdf(obj,X)
    
    sigma1 = sqrt(obj.Covariance(1)); sigma2 = sqrt(obj.Covariance(4));
    
    z = obj.standardize(X);
    
    output1 = (1 / (2*pi*sigma1*sigma2*sqrt(1-obj.Correlation^2))) ...
              * exp(obj.expTerm(z));

%%% sanity check, delete later 

%     d = 2*pi*sigma1*sigma2;
%     
%     e = sqrt(1-obj.Correlation^2);
%     
%     woof = (1 / (d*e)) * exp(obj.expTerm(z))
    
end
