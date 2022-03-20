function yax = deviance(obj, Data)    
    yax = -2 * sum(logpdf(obj, Data));
end