function output5 = rng(obj, size)

    mu1 = obj.Mean(1); mu2 = obj.Mean(2);
    sigma1 = obj.Covariance(1); sigma2 = obj.Covariance(4);

    if nargin < 3, size = 1; end
    
    x1 = mvnrnd(mu1, sigma1, size);
    
    x2 = mvnrnd(mu2 + sigma2*obj.Correlation*((x1-mu1)/sigma1),...
        sigma2^2*sqrt(1-obj.Correlation^2),size);


    % output5 = mvnrnd(Mu, Sigma, n);

end

