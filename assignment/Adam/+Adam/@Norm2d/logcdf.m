function yax = logcdf(obj, xax)

yax=log(mvncdf(xax,obj.Mean,obj.Covariance));

end

