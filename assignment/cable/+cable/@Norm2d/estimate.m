function obj = estimate(obj,data)
    % Take a 2*n matrix as input
    if size(data,1) ~= 2
        error('Error: Input data must be size 2 * n');
    end
    % Compute mean and covariance matrix from data
    mu = mean(data,2);
    sigma = cov(data(1,:),data(2,:));
    % Use those values to update the Norm2d object
    obj.Mean = mu;
    obj.Covariance = sigma;
end
