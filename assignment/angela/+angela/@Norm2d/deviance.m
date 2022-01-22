function output6 = deviance(obj,X)
    
    output6 = sum(obj.logpdf(obj,X)) * -2;

end


