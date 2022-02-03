classdef (Abstract) Distribution
% Distribution  An abstract class for distributions
   
    % Abstract properties *must* be set by the subclass
    properties (Abstract)
    end

    properties (Abstract, Constant)
        Name (1,1) string
    end
    
    
    % Methods are functions that belong to the class
    methods
        
        % Print the distribution to screen
        function disp(obj, propertyList)
            
            fprintf('  %s distribution with parameters:\n', obj.Name);

            for p = 1:numel(propertyList)
                fprintf('     +  %-20s=%8.4f\n', ...
                    propertyList{p}, ...
                    obj.(propertyList{p}))             
            end

            fprintf('\n');
            
        end

    end
    
    
    % Abstract methods *must* be implemented by children of the class
    methods (Abstract)
        
        cdf(obj, xValue)

        logPdf(obj, xValue)

        logPdfKernel(obj, xValue)
        
    end


    % these ordinary methods apply to all children of the class
    methods

        % These are things that are true for all distributions...
        function yax = deviance(obj, data)
            yax = -2 * sum(obj.logPdf(data));
        end

        function yax = pdf(obj, data)
            yax = exp(obj.logPdf(data));
        end

        function knl = pdfKernel(obj, xax)     
            knl = exp(obj.logPdfKernel(xax));
        end
        
        function x = rnd(obj, dims)
            x = obj.inverseCdf(rand(dims));            
        end

    end
end
