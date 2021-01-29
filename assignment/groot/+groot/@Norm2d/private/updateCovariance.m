% Update Precision, StandardDeviation and Correlation based on Covariance
function obj = updateCovariance(obj)
    obj.Precision = inv(obj.Covariance);
    obj.StandardDev = sqrt(diag(obj.Covariance));
    obj.Correlation = obj.Covariance(1,2) / prod(obj.StandardDev);
end
