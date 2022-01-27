% classdef Norm2d
%     %NORM2D Summary of this class goes here
%     %   Detailed explanation goes here
%     
%     properties
%         Mean(2,1) double {mustBeReal, mustBeFinite} = eye(2,1) %the default to be 2x1 matrix (suggestion: eye(2,1))
%         Covariance(2,2) double {mustBeReal} = eye(2,2) %set the default to be a 2x2 matrix (suggestion: eye(2,2))
%         %make sure to add something that checks that the covariances in the
%         %covariance matrix are the same!
%     end
%     
%     %add precision (the first failed I got for when I ran the test suite for your code 
%     % is related to no precision property), correlation, and maybe standard deviation as properties
%     %(that are derived from the original properties)
%     %these should be a in a different section than the mean and covariance properties
%     
%     
%     methods
%         
%         function obj = set.Mean(obj, val)
%             obj.Mean = val
%         end
%         
%         function obj = set.Covariance(obj, val)
%             obj.Covariance = val
%         end
%         
%         
%         function obj = Norm2d(mu, sigma)
%             if nargin > 0
%                 obj.Mean = mu; %mean should be a set to a 2x1 matrix
%                 if nargin > 1
%                     obj.Covariance = sigma; %covariance needs to be set to a 2x2 covariance matrix
%                 end
%             end
%             %need an updater for the properties that are based on
%             %covariance
%         end
% 
%         %below is somethign you could use as your Norm2d constructor 
% %         
% %         function obj = Norm2d(Mean, Covariance)
% %             if nargin > 0
% %                 obj.Mean = Mean;
% %                 if nargin > 1
% %                     obj.Covariance = Covariance;
% %                 end
% %             end
% %             
% %            obj = updateCovariance(obj);
% % 
% %             
% %         end
%         
%         %you are so brave for making your own pdf function!
%         %joachim suggested that I just clone the Normal.m file from the
%         %assignment folder and then make changes on there (since the
%         %Normal.m file isn't perfect)
%         
%                        
%         % Probability density function FROM JOACHIM'S NORMAL.M
%         function yax = pdf(obj, xax)
%             yax = obj.ScalingConstant ...
%                 * obj.Precision ...
%                 * pdfKernel(obj, xax);
%         end
%         
%         function out_pdf = pdf(x, mu, sigma) %need to input 
%             x1 = x(1,:) 
%             x2 = x(2,:)
%             m1 = mu(1)
%             m2 = mu(2)
%             sig1 = sigma(1)
%             sig2 = sigma(2)
%             p = obj.Covariance/sig1*sig2
%             z = (x1-m1/sig1)^2-2*p*((x1-m1)/sig1)*((x2-m2)/sig2)+((x2-m2)/sig2)^2
%             out_pdf = 1/2*pi*sig1*sig2*sqrt(1-p^2)*exp((-1/2)*(z/(1-p^2))) 
%         end
%         
%         function obj = log_pdf(x, mu, sigma, out_pdf) 
%             %if out_pdf is the input, i don't think you need to repeat the x, mu, and sigma
%             %as inputs 
%            obj = log(out_pdf) 
%         end
%         
% 
%         
%         function out_cdf = cdf(x, mu, sigma)
%             out_cdf = mvncdf(x, mu, sigma)
%         end
%         
%         function obj = log_cdf(x, mu, sigma)
%            obj = log(out_cdf)
%         end
%         
%         function obj = rng(mu, sigma, size)
%            % struggling with rng, will continue to work on it
%         end
%         
%         % Random number generator from Joachim's code. Don't use this as-is bc
%         % its not correct without some tweaking 
%         function x = rnd(obj, dims)            
%             if nargin < 2, dims = 1; end            
%             x = obj.unstandardize(randn(dims));            
%         end
%         
%         function obj = deviance(data, mu, sigma)
%             % this one too
%             obj = -2*(log_pdf(data, mu, sigma))
%            
%         end
%     end
% end

%since joachim advised me to just copy and paste Normal.m to start the assignment, that's what I'm
%going to do and I'm going to make changes/improvments to there

classdef Normal 
    % NORMAL  A class for the normal distribution
    
    % The main properties are the mean and standard deviation
    properties
        Mean(2,1) double {mustBeReal, mustBeFinite} ...
            = eye(2,1)
        Covariance(2,2) double {mustBeReal, mustBeFinite, mustBePositive} ...
            = eye(2,2)
    end
    
    % Derived properties that need to be set internally
    properties (SetAccess = private)
        Precision
        Correlation
        StandardDeviation
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
        function obj = Normal(Mean, Covariance)
            if nargin > 0
                % This triggers the implicit setter for Mean
                obj.Mean = Mean;
                if nargin > 1
                    % This triggers the explicit setter for StandardDeviation
                    obj.Covariance = Covariance;
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
            F = '     %s  %-20s= %8.4f \t %8.4f \n \t\t\t%8.4f\t%8.4f';
            
            fprintf('  %s distribution with parameters:\n', obj.Name);

            fprintf(f, t, 'Mean'              , obj.Mean              );
            fprintf(F, b, 'Covariance', obj.Covariance );
            
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



