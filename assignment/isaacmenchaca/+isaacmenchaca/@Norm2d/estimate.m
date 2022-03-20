function obj = estimate(X)
% Expects: Input is a 2xN matrix X (sufficiently conditioned that you can 
%             compute a mean and covariance matrix).
% Promises: Output is a Norm2d object with its properties Mean and Covariance 
%             set to the mean and covariance matrix of the input matrix X 
%             (and all contingent properties updated).


% took out try and catch statement since class detects for error anyway.
        Mu = mean(X, 2);
        Sigma = cov(X(1,:), X(2, :));
        obj = isaacmenchaca.Norm2d(Mu, Sigma);
    
    
end

