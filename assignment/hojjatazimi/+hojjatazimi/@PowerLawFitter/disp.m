function disp(obj)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
disp('Something about your data:')
disp('It has ' + string(obj.Count) + ' Trial(s).')

if obj.fit
    disp('A PowerLaw model has been fit on your data! These are the properties of the model:')
    disp('-Estimated Asymptote:' + string(obj.EstimatedAsymptote))
    disp( '-Estimated Exposure:' + string(obj.EstimatedExposure))
    disp( '-Estimated Rate:' + string(obj.EstimatedRate))
    disp( '-Estimated Range:' + string(obj.EstimatedRange))
else
    disp('You may fit a PowerLaw model on your data using .Fit() method!')
end
end