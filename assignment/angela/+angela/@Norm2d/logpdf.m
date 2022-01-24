function output2 = logpdf(obj,X)

    sigma1 = sqrt(obj.Covariance(1)); sigma2 = sqrt(obj.Covariance(4));

    z = obj.standardize(X);
    
    output2 = -log(2*pi*sigma1*sigma2) - 0.5*log(1-obj.Correlation^2) ...
              - obj.expTerm(z);

%     x1 = X(1,:); x2 = X(2,:);
%     mu1 = Mu(1); mu2 = Mu(2);
%     sigma1 = Sigma(1); sigma2 = Sigma(4);
%     
%     z = (x1 - mu1/sigma1)^2 - 2 * obj.Correlation * ((x1 - mu1)/sigma1)) ...
%         * ((x2 - mu2)/sigma2) + ((x2 - mu2)/sigma2)^2;
% 
%     output2 = - log(2*pi*Sigma(1)*Sigma(4)) - 0.5*log(1-obj.Correlation^2) ...
%               - (0.5 * (z/(1-obj.Correlation^2)));
    

end
