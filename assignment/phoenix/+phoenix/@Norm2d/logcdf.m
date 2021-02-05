% Log Cumulative Density Function (logcdf, log(P(X1, X2 <= x1, x2))) for BVN
% Input: 2xn matrix of points. Output: 1xn log cumulative density 

function logcumprob = logcdf(obj, val)

     arguments
        obj
        val (2,:) {mustBeFinite, mustBeReal}
     end

     for i = 1:size(val,2)
        logcumprob(i) = log(mvncdf(val(:,i),obj.Mean,obj.Covariance));
end

