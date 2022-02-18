function yax = logcdf(obj, X)
% LOGCDF computes the log cumulative distribution function for a bivariate normal
% using the mvncdf() function from the Statistics & Machine Learning
% toolbox

if size(X, 2) ~= size(obj.Mean, 1)
    X = X';
end

yax = log(mvncdf(X, obj.Mean', obj.Covariance)');
end