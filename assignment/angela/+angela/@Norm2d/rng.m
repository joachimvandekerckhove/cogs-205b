function output5 = rng(Mu, Sigma, size)

    mu1 = Mu(1); mu2 = Mu(2);
    sigma1 = Sigma(1); sigma2 = Sigma(4);

    if nargin < 3, size = 1; end
    
    x1 = mvnrnd(mu1, sigma1, size);
    
    x2 = mvnrnd(mu2 + sigma2*obj.Correlation*((x1-mu1)/sigma1),...
        sigma2^2*sqrt(1-obj.Correlation^2),size);


    % output5 = mvnrnd(Mu, Sigma, n);

end

