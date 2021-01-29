function x = rnmvn2d(obj,sizes)
    % Generating Random numbers with 2D Multivariate Normal distribution.

    % If no number of samples (sizes) is declared, set sample size to 1
    if nargin < 2
        sizes = 1;
    end
    
% Check properties of sizes
    if ~(isnumeric(sizes) & isinteger(sizes) & isfinite(sizes))
        error('Number of samples must be an integer')
    end

% Generate a matrix of size 2xsizes of standard normal random variables
    z = randn(2,sizes);

% Trnasform the standard normal rv to a 2d MVN with mean Mean and covariance matrix CovM    
    for i = 1:sizes
        x(:,i) = obj.unstandardize(z(:,i));
    end
end