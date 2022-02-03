function dev = deviance(obj, data)

    % DEVIANCE    calculates deviance
    dev = -2 * sum(obj.logpdf(obj, data));
    
end