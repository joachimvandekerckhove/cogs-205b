function yax = cdf(obj, xax)
    yax = mvncdf(xax',obj.Mean',obj.Covariance);
    yax = yax';
end