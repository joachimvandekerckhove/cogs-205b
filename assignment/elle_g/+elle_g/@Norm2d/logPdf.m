        % Log Probability density function
        function yax = logPdf(obj, xax)
            yax = log(obj.ScalingConstant) + log(obj.Precision) + obj.logPdfKernel(xax); 
        end
        