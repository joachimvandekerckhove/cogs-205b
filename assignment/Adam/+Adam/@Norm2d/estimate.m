function [obj]=estimate(X)
% Set Norm2d object with the data

% a static method pseudonym.Norm2d().estimate(X) 
% Expects: Input is a 2xN matrix X (sufficiently conditioned that you can
% compute a mean and covariance matrix).
% Promises: Output is a Norm2d object with its properties Mean and
% Covariance set to the mean and covariance matrix of the input matrix X
% (and all contingent properties updated).

obj.Mean=mean(X');
obj.Covariance=cov(X');


end