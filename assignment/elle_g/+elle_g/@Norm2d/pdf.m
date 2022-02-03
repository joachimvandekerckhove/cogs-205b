        % Probability density function
        function yax = pdf(obj, xax)
            yax = obj.ScaleFactor * exp(logkernel(obj, xax)); %credit:xavier
        end