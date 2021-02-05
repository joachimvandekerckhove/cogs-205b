% Update Internal Properties for BVN: Precision, Correlation, Scaling Constant Value

function obj = updateInternalProperties(obj)
	obj.Precision = inv(obj.Covariance);
	obj.Correlation = obj.Covariance(1,2)./prod(sqrt(diag(obj.Covariance)));
	obj.scaleValue = 2*pi*prod(sqrt(diag(obj.Covariance)))*sqrt(1-obj.Correlation^2);
end
