function estimate_mean(X)
% This function takes a 2xN matrix and returns an object of the class
% Norm2d with mean vector equal to the mean of the rows and a Covariance matrix.

    % Check properties of the data matrix
    Check_data(X);

    % Estimate mean of the rows
     Norm2d(mean(X,2));
end