function out = deviance(obj, data)
    tmp = obj.logpdf(data);
    out = sum(tmp, 'all');
end