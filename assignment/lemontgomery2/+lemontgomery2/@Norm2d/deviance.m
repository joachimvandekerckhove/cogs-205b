function dev = deviance(obj, data)

    % DEVIANCE    Calculates deviance
    dev = -2 * sum(obj.logpdf(obj, data));
    
end