% Update Precision based on CovarianceMatrix
function obj = updateCovarianceMatrix(obj)

sigsig = sqrt(obj.Covariance(1) * obj.Covariance(4));

obj.Precision   = inv(obj.Covariance);

obj.Correlation = obj.Covariance(2) / sigsig;

obj.ScaleFactor = obj.ScalingConstant / ...
    (sigsig * sqrt(1-obj.Correlation^2));

obj.logScaleFactor = log(obj.ScalingConstant) ...
    - log(sigsig) - 0.5*log(1-obj.Correlation^2);

end