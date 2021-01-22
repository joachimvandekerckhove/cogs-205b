% Plot the CDF
function plotcdf(obj, varargin)

xax = obj.xaxis;
line(xax, obj.cdf(xax), varargin{:})

end
