function yax = cdf(obj, X)
% CDF computes the cumulative distribution function for a bivariate normal
% using the mvncdf() function from the Statistics & Machine Learning
% toolbox

% this function is similar to the one in logcdf
if size(X, 2) ~= size(obj.Mean, 1)
    X = X';
end

yax = mvncdf(X, obj.Mean', obj.Covariance)';
end

