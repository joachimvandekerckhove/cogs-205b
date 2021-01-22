% Calculate horizontal axis for plotting
function xax = xaxis(obj)

bounds = obj.unstandardize(5 * [-1 1]);
xax = linspace(bounds(1), bounds(2), 101);

end