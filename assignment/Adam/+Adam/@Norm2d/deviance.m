function yax=deviance(obj, data)

yax=-2*sum(obj.logpdf(obj, data));

end

