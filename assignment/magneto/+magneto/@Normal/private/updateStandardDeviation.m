% Update Variance and Precision based on StandardDeviation
function obj = updateStandardDeviation(obj)

obj.Variance  = obj.StandardDeviation.^2;
obj.Precision = 1 ./ obj.Variance;

end