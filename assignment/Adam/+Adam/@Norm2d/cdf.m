function yax = cdf(obj, xax)

yax=mvncdf(xax,obj.Mean,obj.Covariance);

end

