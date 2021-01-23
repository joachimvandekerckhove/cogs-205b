% Random number generator
function x = rnd(obj, dims)

if nargin < 2
    dims = [1 1];
end
    
x = obj.unstandardize(randn(dims));

end
