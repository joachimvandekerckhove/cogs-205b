% Plot the PDF
function plotpdf(obj, varargin)

xax = obj.xaxis;
line(xax, obj.pdf(xax), varargin{:})

end