% Log Probability Density Function (logpdf, log(P(X1, X2 = x1, x2))) for BVN
% Input: 2xn matrix of points. Output: 1xn log probability density
% Relies on internal function "stand" which Z scores inputs

function logprob = logpdf(obj, val)

     arguments
        obj
        val (2,:) {mustBeFinite, mustBeReal}
     end

     for i = 1:size(val,2)
        sqTerms = stand(val(:,i),obj.Mean,diag(obj.Covariance)).^2;
        innerTerm = -2*obj.Correlation*prod(stand(val(:,i),obj.Mean,diag(obj.Covariance)));
        z = sum(sqTerms) + innerTerm;
        logprob(i) = -z./(2*(1-obj.Correlation.^2)) - log(obj.scaleValue);
end

