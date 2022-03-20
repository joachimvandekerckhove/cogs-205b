function output = estimate(X)

% ESTIMATE computes the mean and covariance of a 2xN matrix X, and returns
% a Norm2d object with Mean and Covariance set to the values computed over
% X

% first make sure input is correct dimensions
if size(X, 1) ~= 2
    % FIXED: Errors should have an errorId in addition to an errorMsg
    error('Norm2d:estimate:badInputX', 'Input must be 2xN');
end

% compute mean
mean1 = mean(X(1,:));
mean2 = mean(X(2,:));
Mean = vertcat(mean1, mean2);

% compute covariance
Covariance = cov(X(1,:), X(2,:));

% create Norm2d object
output = mariakhoudary.Norm2d(Mean, Covariance);