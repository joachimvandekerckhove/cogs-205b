% Probability Density Function (pdf, P(X1, X2 = x1, x2)) for BVN
% Input: 2xn matrix of points. Output: 1xn probability density 
% Relies on internal function "stand" which Z scores inputs

function prob = pdf(obj, val)

     arguments
        obj
        val (2,:) {mustBeFinite, mustBeReal}
     end

     for i = 1:size(val,2)
	sqTerms = stand(val(:,i),obj.Mean,diag(obj.Covariance)).^2;
	innerTerm = -2*obj.Correlation*prod(stand(val(:,i),obj.Mean,diag(obj.Covariance)));
	z = sum(sqTerms) + innerTerm; 
	prob(i) = obj.scaleValue.^-1*exp(-z./(2*(1-obj.Correlation.^2)));
end
