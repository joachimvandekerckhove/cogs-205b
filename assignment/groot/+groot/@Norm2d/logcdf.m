function yax = logcdf(obj, xax)
% CDF Log-Cumulative distribution function for Norm2d
% Input: 2xn matrix of points. Output: 1xn log cumulative density 

validateattributes(xax,{'numeric'}, {'ndims',2,'nrows',2,'finite','real'});

try
    yax = transpose(log(mvncdf(transpose(xax), transpose(obj.Mean), obj.Covariance)));
catch e
    error(e.message);
end
end
