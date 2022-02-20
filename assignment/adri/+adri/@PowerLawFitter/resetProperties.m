% When the data is changed, the parameter values previously estimated are
% reset and the size of this new data string is registered.
function clearParameters(obj)
    obj.EstimatedAsymptote = [];
    obj.EstimatedRange = [];
    obj.EstimatedRate = [];
    obj.EstimatedExposure = [];
    obj.Count = size(obj.ObservedRT,2);
end