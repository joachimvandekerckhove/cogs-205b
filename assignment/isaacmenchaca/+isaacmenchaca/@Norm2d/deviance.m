function yax = deviance(obj, Data)    
    yax = sum(logpdf(obj, Data));
end