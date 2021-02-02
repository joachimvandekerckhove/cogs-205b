function obj = updatePresCorM(obj)
%Updated the Precision Matrix and Correlation after a change in CovM
    obj.Precision = inv(obj.Covariance)
    obj.Correlation = obj.Covariance(2,1) ./ (obj.Covariance(1,1)*obj.Covariance(2,2))
    obj.determinant = det(obj.Covariance)
    obj.invsqrtdet = (obj.determinant)^(-0.5)
    obj.loginvsqrtdet = -0.5 * log(obj.determinant)
end