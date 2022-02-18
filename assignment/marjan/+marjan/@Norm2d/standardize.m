function z = standardize(obj, X)
% STANDARDIZE returns an array of standardized values for the bivariate
% normal 

% assign values to variables to enhance readability & flexibility

x1 = X(1,:);
x2= X(2, :);

mu1= obj.Mean(1);
mu2 = obj.Mean(2);

sigma1=sqrt(obj.Covariance(1,1));
sigma2=sqrt(obj.Covariance(2,2));

rho=obj.Correlation;

z = ((x1-mu1)/sigma1).^2 ...
    - (2*rho)*(((x1-mu1)/sigma1) .* ((x2-mu2)/sigma2)) ...
    + ((x2-mu2)/sigma2).^2;

end