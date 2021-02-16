function obj = estimate_covariance(obj,X)
% This function takes a 2xN matrix and returns an object of the Covariance Matrix
% of a Norm2d class object.

    % Check Properties of the data matrix
    Check_data(X);

    % Number of observations
    N = size(X,2);

    % vector for centered variables
    z = zeros(2,N);

    % Center observations
    for i = 1:N
        z(,i) = X(:,i) - obj.Mean;
    end

    % Estimate Covariance Matrix
    obj.Covariance = 1./(N-1) .* (z.' * z);
end