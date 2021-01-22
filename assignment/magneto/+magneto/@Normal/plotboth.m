% Plot the PDF and CDF
function plotboth(obj, varargin)

subplot(1,2,1)
obj.plotpdf(varargin{:})

subplot(1,2,2)
obj.plotcdf(varargin{:})

end
