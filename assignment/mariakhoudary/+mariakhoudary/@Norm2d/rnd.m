function x = rnd(obj, size)
% RNd Generates a random sample (dimensions specified by size) from the
% bivariate normal 

if nargin <2, size=1; end
rng(205);

mu1=obj.Mean(1);
mu2=obj.Mean(2);

sigma1=sqrt(obj.Covariance(1,1));
sigma2=sqrt(obj.Covariance(2,2));

rho=obj.Correlation;

x1 = sigma1.* randn(1, size) + mu1;

x2 = (sigma2^2*sqrt(1-rho)) .* randn(1, size) ...
    + (mu2 + sigma2*rho*((x1-mu1)./sigma1));

x = vertcat(x1, x2);
end

