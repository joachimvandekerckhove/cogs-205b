classdef Normal < Distribution
    % NORMAL  A class for the normal distribution
    
    % The main properties are the mean and standard deviation
    properties
        Mean double {mustBeReal, mustBeFinite} ...
            = 0
        StandardDeviation double {mustBeReal, mustBeFinite, mustBePositive} ...
            = 1
    end
    
    % Derived properties that need to be set internally
    properties (SetAccess = private)
        Precision
        Variance
    end
    
    % The Gaussian scaling constant is sometimes useful
    properties (Constant)
        ScalingConstant = (2*pi).^(-0.5);
        Name = 'Normal';
    end
    
    
    % Methods are functions that belong to the class
    methods
        
        %%% Constructor function %%%
        
        % A main constructor, for a new Normal
        function obj = Normal(Mean, StandardDeviation)
            if nargin > 0
                % This triggers the implicit setter for Mean
                obj.Mean = Mean;
                if nargin > 1
                    % This triggers the explicit setter for StandardDeviation
                    obj.StandardDeviation = StandardDeviation;
                end
            end
            obj = updateStandardDeviation(obj);
        end
        
        
        %%% Display function %%%
        
        % Print the distribution to screen
        function disp(obj)
        
            t = sprintf('+');
            b = sprintf('+');
            
            f = '     %s  %-20s=%8.4f\n';
            
            fprintf('  %s distribution with parameters:\n', obj.Name);

            fprintf(f, t, 'Mean'              , obj.Mean              );
            fprintf(f, b, 'Standard deviation', obj.StandardDeviation );
            
            fprintf('\n');
            
        end
        
        
        % Print the distribution to screen
        function str = print(obj)
        
            t = sprintf('+');
            b = sprintf('+');
            
            f = '     %s  %-20s=%8.4f\n';
            
            str = sprintf('%s%s%s', ...
                sprintf('  %s distribution with parameters:\n', obj.Name), ...
                sprintf(f, t, 'Mean'              , obj.Mean              ), ...
                sprintf(f, b, 'Standard deviation', obj.StandardDeviation ));
            
        end
        
        
        %%% Getters and setters %%%
        
        % Setter for StandardDeviation
        function obj = set.StandardDeviation(obj, val)
            % Set the value
            obj.StandardDeviation = val;
            % Update contingent properties
            obj = updateStandardDeviation(obj);
        end
        
        % Updater for StandardDeviation
        function obj = updateStandardDeviation(obj)
            obj.Variance  = obj.StandardDeviation^2;
            obj.Precision = 1/obj.Variance;
        end
        
        
        % Computation functions
        
        % Cumulative distribution function
        function yax = cdf(obj, xax)
            zax = obj.standardize(xax);
            yax = 0.5 * (1 + erf(zax ./ sqrt(2)));
        end
        
        % Probability density function
        function yax = pdf(obj, xax)
            yax = obj.ScalingConstant ...
                * obj.Precision ...
                * pdfKernel(obj, xax);
        end
        
        % Log Probability density function
        function yax = logPdf(obj, xax)
            yax = log(obj.ScalingConstant) + log(obj.Precision) + obj.logPdfKernel(xax);
        end
        
        % Deviance score function
        function yax = deviance(obj, data, parameters)
            obj.Mean              = parameters(1);
            obj.StandardDeviation = parameters(2);
            yax = log(obj.ScalingConstant) + log(obj.Precision) + obj.logPdfKernel(data);
        end
        
        % Probability density kernel
        function knl = pdfKernel(obj, xax)     
            knl = exp(logPdfKernel(obj, xax));
        end
        
        % Probability density log kernel
        function knl = logPdfKernel(obj, xax) 
            zax = obj.standardize(xax);
            knl =  -0.5 * zax.^2;
        end        
        
        % Random number generator
        function x = rnd(obj, dims)            
            if nargin < 2, dims = 1; end            
            x = obj.unstandardize(randn(dims));            
        end
        
        % Standardize a variate
        function z = standardize(obj, x)
            z = (x - obj.Mean) ./ obj.StandardDeviation;
        end
        
        % Unstandardize a variate
        function x = unstandardize(obj, z)
            x = obj.Mean + z * obj.StandardDeviation;
        end
        
        % Integrate a function over this distribution
        function A = integrateOver(obj, fcn)
            
            w = [ 2.22939E-13  4.39934E-10  1.08607E-7  7.80256E-6  2.28339E-4 ...
                0.00324377   0.0248105    0.109017    0.286676    0.462244   ...
                0.462244     0.286676     0.109017    0.0248105   0.00324377 ...
                2.28339E-4   7.80256E-6   1.08607E-7  4.39934E-10 2.22939E-13];
            
            x = [ -5.38748  -4.60368  -3.94476  -3.34785  -2.78881  ...
                -2.25497  -1.73854  -1.23408  -0.73747  -0.24534  ...
                0.24534   0.73747   1.23408   1.73854   2.25497  ....
                2.78881   3.34785   3.94476   4.60368   5.38748];
            
            A = sum(fcn(x * sqrt(2) * obj.StandardDeviation + obj.Mean) ./ sqrt(pi) .* w);
            
        end
        
    end
    
    
    % Static methods don't need the object as input
    methods (Static)
        
        testSuite()
        
    end
    
end
