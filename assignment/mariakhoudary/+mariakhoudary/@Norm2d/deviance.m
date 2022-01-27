function yax = deviance(obj, data)
% DEVIANCE computes deviance by summing the logpdf of all points in 
% the data parameter

yax = -2 * sum(obj.logpdf(data'), 'all');

if ~isscalar(yax)
    error('Error: deviance is not scalar')
end

end

