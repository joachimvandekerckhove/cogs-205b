function output1 = pdf(X, Mu, Sigma)
    
    x1 = X(1,:); x2 = X(2,:);
    mu1 = Mu(1); mu2 = Mu(2);
    sigma1 = Sigma(1); sigma2 = Sigma(4);
    
    z = (x1 - mu1/sigma1)^2 - 2 * obj.Correlation * ((x1 - mu1)/sigma1)) ...
        * ((x2 - mu2)/sigma2) + ((x2 - mu2)/sigma2)^2;
    
    output1 = (1 / (2*pi*sigma1*sigma2*sqrt(1-obj.Correlation)) ...
              * exp((-1/2)*(z/(1-obj.Correlation^2)));
    
end
