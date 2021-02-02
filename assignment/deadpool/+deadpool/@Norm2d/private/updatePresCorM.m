function obj = updatePresCorM(obj)
%Updated the Precision Matrix and Correlation after a change in CovM
    obj.Precision = inv(obj.Covariance)
    obj.Correlation = obj.Covariance(2,1) ./ (obj.Covariance(1,1)*obj.Covariance(2,2))
end