function out = pdf(obj,X)

% PDF computes a probability density function for a bivariate normal

sigma1 = sqrt(obj.Covariance(1));
sigma2 = sqrt(obj.Covariance(4));

rho = obj.Correlation;

out = (1/(2*pi*sigma1*sigma2*sqrt(1-rho^2))) ...
    *exp((-1/2).*(obj.standardize(X)/(1-(rho^2))));
end