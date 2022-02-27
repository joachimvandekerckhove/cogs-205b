function yax = pdf(obj, X)
% PDF computes the probability density function for a bivariate normal
% distribution

% assign values to variables to improve readability & enhance flexibility

sigma1=sqrt(obj.Covariance(1,1));
sigma2=sqrt(obj.Covariance(2,2));

rho=obj.Correlation;

yax = (1/(2*pi*sigma1*sigma2*sqrt(1-rho^2))) ...
    *exp((-1/2).*(obj.standardize(X)/(1-(rho^2))));

end