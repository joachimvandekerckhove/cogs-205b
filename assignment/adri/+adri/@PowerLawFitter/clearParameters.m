%Clear previous parameter estimates when data changes
function clearParameters(obj)
    obj.EstimatedAsymptote = [];
    obj.EstimatedRange = [];
    obj.EstimatedRate = [];
    obj.EstimatedExposure = [];    
end