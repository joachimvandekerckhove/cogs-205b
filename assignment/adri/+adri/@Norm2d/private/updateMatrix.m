%Update the Precision and Covariance Matrix
function obj = updateMatrix(obj)
    denom = sqrt(obj.Covariance(1,1)*obj.Covariance(2,2));
    comp = 1-obj.Correlation^2;
    obj.Precision = inv(obj.Covariance);
    obj.Correlation = obj.Covariance(1,2) / denom;
    obj.ScaleFactor = obj.ScalingConstant / (denom * sqrt(comp));
    obj.logScaleFactor = log(obj.ScalingConstant) - log(denom) - 0.5*log(comp);
end