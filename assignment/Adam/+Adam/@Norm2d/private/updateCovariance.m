% Update Correlation and Precision based on Covariance
function obj = updateCovariance(obj)
% update precision
obj.Precision=inv(obj.Coveriance);
% update correlation (rho)
obj.Correlation=obj.Covariance(1,2)/(sqrt(obj.Covariance(1,1))*sqrt(obj.Covariance(2,2));
end
