%Update the Precision and Covariance Matrix
function obj = updateMatrix(obj)
    denom = sqrt(obj.Covariance(1) * obj.Covariance(4));
    obj.Precision = inv(obj.Covariance);
    obj.Correlation = obj.Covariance(2) / denom;
    obj.ScaleFactor = obj.ScalingConstant / (denom * sqrt(1-obj.Correlation^2));
    obj.logScaleFactor = log(obj.ScalingConstant) - log(denom) ...
        - 0.5*log(1-obj.Correlation^2);
end