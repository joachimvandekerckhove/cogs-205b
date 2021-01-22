% Standardize a variate
function z = standardize(obj, x)

z = (x - obj.Mean) ./ obj.StandardDeviation;

end
