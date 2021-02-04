function yax = logcdf(obj, xax)
% CDF Log-Cumulative distribution function for Norm2d

validateattributes(xax,{'numeric'}, {'ndims',2,'nrows',2});
try
    yax = log(mvncdf(transpose(xax), transpose(obj.Mean), obj.Covariance));
catch e
    error(e.message);
end
end
