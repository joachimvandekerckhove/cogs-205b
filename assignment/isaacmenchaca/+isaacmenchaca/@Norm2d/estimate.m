function obj = estimate(X)
% Expects: Input is a 2xN matrix X (sufficiently conditioned that you can 
%             compute a mean and covariance matrix).
% Promises: Output is a Norm2d object with its properties Mean and Covariance 
%             set to the mean and covariance matrix of the input matrix X 
%             (and all contingent properties updated).

    try 
        Mu = mean(X, 2);
        Sigma = cov(X(1,:), X(2, :));
        obj = isaacmenchaca.Norm2d(Mu, Sigma);
    catch 
        ME = MException('Input:IncorrectDimensionsNorPositiveDefinite', ...
            'X is not of size 2xN (dimensions) or is not positive-definite covariance');
         throw(ME)
    end
    
    
    
end

