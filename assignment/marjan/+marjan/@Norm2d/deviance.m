function output = deviance(obj, data)
% DEVIANCE computes deviance by summing the logphdf of all points in the
% data parameter

output = -2 * sum(obj.logpdf(data'), 'all');

if ~scalar(output)
    error('Error: deviance is not scalar')
end
end