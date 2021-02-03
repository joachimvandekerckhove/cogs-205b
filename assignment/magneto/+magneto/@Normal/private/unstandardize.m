% Unstandardize a variate
function x = unstandardize(obj, z)

x = obj.Mean + z * obj.StandardDeviation;

end
