% When the data is changed, the parameter values previously estimated are
% reset and the size of this new data string is registered.
function resetProperties(obj)
    
    % Reset parameter values
    obj.EstimatedAsymptote = [];
    obj.EstimatedRange = [];
    obj.EstimatedRate = [];
    obj.EstimatedExposure = [];

    % Update the Count property
    obj.Count = size(obj.ObservedRT,2);
end