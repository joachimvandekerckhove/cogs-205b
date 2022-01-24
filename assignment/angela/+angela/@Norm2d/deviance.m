function yax = deviance(obj,X)
    
    yax = sum(obj.logpdf(X)) * -2;

end


