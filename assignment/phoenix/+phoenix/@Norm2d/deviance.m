% Deviance (-2*sum(log(P(X1,X2=x1,x2)))) for BVN
% Input: 2xn data matrix. Output: 1x1
% Relies on output from Norm2d method "logpdf"

function dev = deviance(obj, data)
	dev = -2*sum(obj.logpdf(data));
end


