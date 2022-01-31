% Assignment: Make a +package called /+<your-pseudonym> with just a class @norm2d
% @norm2d % implements the bivariate normal likelihood equivalence class
% has at least the properties mean (2x1 vector) and covariance (2x2 vector)
% Include getters/setters and these six methods: 
% pdf, (log)pdf, cdf, (log)cdf, rand, deviance
% make sure everything works on matrix input
% Avoid duplicating code
% pass the test suite

b = Cass.Norm2d

classdef Norm2d 
    % NORMAL  A class for the normal distribution
    
    % The main properties are the mean and standard deviation
    properties
        Mean double {mustBeReal, mustBeFinite} ...
            = 0;0
        Covariance double {mustBeReal, mustBeFinite, mustBePositive} ...
            = 1,1:1,1
    end
    
    % Derived properties that need to be set internally
    properties (SetAccess = private)
        Precision
        Variance
    end
    
    % The Gaussian scaling constant is sometimes useful
    properties (Constant)
        ScalingConstant = (2*pi).^(-0.5);
        Name = 'Norm2d';
    end
    
    
    % Methods are functions that belong to the class
    methods
        
        %%% Constructor function %%%
        
        % A main constructor, for a new Normal
        function obj = Norm2d(Mean, Covariance)
            if nargin > 0
                % This triggers the implicit setter for Mean
                obj.Mean = Mean;
                if nargin > 1
                    % This triggers the explicit setter for StandardDeviation
                    obj.Covariance = Covariance;
                end
            end
            obj = updateCovariance(obj);
        end
        
        
        %%% Display function %%%
        
        % Print the distribution to screen
        function disp(obj)
        
            t = sprintf('+');
            b = sprintf('+');
            
            f = '     %s  %-20s=%8.4f\n';
            
            fprintf('  %s distribution with parameters:\n', obj.Name);

            fprintf(f, t, 'Mean'              , obj.Mean              );
            fprintf(f, b, 'Covariance', obj.Covariance );
            
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
                sprintf(f, b, 'Covariance', obj.Covariance ));
            
        end
        
        
        %%% Getters and setters %%%
        
        % Setter for Covariance
        function obj = set.Covariance(obj, val)
            % Set the value
            obj.Covariance = val;
            % Update contingent properties
            obj = updateCovariance(obj);
        end
        
         % Setter for Mean
         function obj = set.Mean(obj, val)
            % Set the value
            obj.Mean = val;
        end

        % Updater for Covariance
        function obj = updateCovariance(obj)
            obj.Precision = inv(obj.Covariance);
            c12 = obj.Covariance(2);
            sigma1 = sqrt(obj.Covariance(1));
            sigma2 = sqrt(obj.Covariance(4));
            obj.Correlation = c12./(sigma1*sigma2)
        end
        
        
        % Computation functions
        
        % Cumulative distribution function
        function yax = cdf(obj, xax)
            yax = mvncdf(xax, obj.Mean, obj.Covariance)
        end

         % Log-Cumulative distribution function
        function yax = logcdf(obj, xax)
            yax = log(mvncdf(xax, obj.Mean, obj.Covariance))
        end
        
        % Probability density function
        function yax = pdf(obj, xax)
            
            z =
            obj.Correlation = c12./(sigma1*sigma2)
            sigma1 = sqrt(obj.Covariance(1));
            sigma2 = sqrt(obj.Covariance(4));
            obj.Correlation = c12./(sigma1*sigma2)
            yax =
            yax = pdf(xax, obj.Mean, obj.Covariance)
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
            x = rng(obj.Mean, obj.Covariance,size);            
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
