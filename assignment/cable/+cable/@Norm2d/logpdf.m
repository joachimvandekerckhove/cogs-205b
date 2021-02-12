function logpdfOut = logpdf(X,Mu,Sigma)
    % DON'T just take the log of pdfOut
    % That is technically what you do, but "simplify" the equation
    
    % Check inputs
    verifyMean(Mu);
    verifySigma(Sigma);
    verifyX(X);
    
    if nargin < 2
        Mu = [0;0];
        Sigma = ones(2);
    elseif nargin < 3
        Sigma = ones(2);
    end
    
    rho = Sigma(1,2) / sqrt(Sigma(1,1) * Sigma(2,2));
    sigma1 = sqrt(Sigma(1,1));
    sigma2 = sqrt(Sigma(2,2));
    z = ((X(1,:) - Mu(1))/sigma1).^2 - ...
        2 * rho .* ((X(1,:) - Mu(1))/sigma1) .* ...
        ((X(2,:) - Mu(2))/sigma2) + ...
        ((X(2,:) - Mu(2))/sigma2).^2;
    
    logpdfOut = log(1) - log(2*pi*sigma1*sigma2*sqrt(1 - rho^2)) + ...
        ((-1/2) * z/(1 - rho^2)) * exp(1);
end