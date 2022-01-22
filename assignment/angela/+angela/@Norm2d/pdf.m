function output1 = pdf(obj,X)
    
%     x1 = X(1,:); x2 = X(2,:);
    % mu1 = obj.Mean(1); mu2 = obj.Mean(2);
    sigma1 = obj.Covariance(1); sigma2 = obj.Covariance(4);
%     roe = Sigma(3)/(sigma1*sigma2);
    
    z = obj.standardize(X);
    
    output1 = (1 / (2*pi*sigma1*sigma2*sqrt(1-obj.Correlation))) ...
              * exp(obj.expTerm(z));
    
%     output1 = (1 / (2*pi*sigma1*sigma2*sqrt(1-obj.Correlation)) ...
%               * exp((-1/2)*(z/(1-obj.Correlation^2)));
    
end
