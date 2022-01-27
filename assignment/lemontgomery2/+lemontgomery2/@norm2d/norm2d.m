classdef Norm2d
    % NORMAL  A class for the bivariate normal distribution
    
    % The main properties are the mean, covariance, precision, and correlation
    properties
        Mean (2,1) double {mustBeReal, mustBeFinite, mustBeVector} ...
            = [ 0; 0 ]
        Covariance (2,2) double {mustBeReal, mustBeFinite, mustBePositive} ...
            = [ 1 0; 0 1 ]
    end
    
    % Derived properties that need to be set internally
    properties(SetAccess = private)
        Precision
        Correlation
    end
    
    % The Gaussian scaling constant is sometimes useful
    properties (Constant)
        ScalingConstant = (2 * pi).^(-0.5);
        Name = 'Norm2d';
    end
    
   
    % Methods are functions that belong to the class
    methods
        
        %%% Constructor function %%%
    
        % A main constructor, for a new Bivariate Normal
        function obj = Normal(Mean, Covariance)
            if nargin > 0
                % This triggers the implicit setter for Mean
                obj.Mean = Mean;
                if nargin > 1
                    % This triggers the explicit setter for Covariance
                    obj.Covariance = Covariance;
                end
            end
            obj = updateCovariance(obj);
        end
        
        %%% Display function %%%
        
        % Print the distrubtion to screen
        
        % Print the distribution to screen
        
        %%% Getters and setters %%%

        % Setter for Covariance
        function obj = set.Covariance(obj, val)
            % Set the value
            obj.Covariance = val;
            % Update contingent properties
            obj = updateCovariance(obj);
        end

        % Updater for Covariance
        function obj = updateCovariance(obj)
            obj.Precision = inv(obj.Covariance);
            obj.Correlation = obj.Covariance(1,2) ...
                / (obj.Covariance(1,1) * obj.Covariance(2,2));
        end
        
        
        % Computation functions
        
        % Probability density function
        function yax = pdf(obj, xax)
            yax = obj.ScalingConstant ...
                * (obj.Covariance(1,1) * obj.Covariance(2,2) * sqrt(1 - obj.Correlation^2)).^(-0.5) ...
                * exp(-0.5 ...
                * ((obj.Mean(1,1) / obj.Covariance(1,1))^2 - 2 * obj.Correlation ...
                * (xax1 - obj.Mean(1,1))/ obj.Covariance(1,1) * obj.Covariance(2,2) ...
                + ((xax2 - obj.Mean(2,1)) / obj.Covariance(2,2))^2 ))...
                * 1 / (1 - obj.Correlation^2);
        end
        
        % Log Probability density function
        function yax = logPdf(obj, xax)
            yax = log(obj.ScalingConstant) + log(obj.Precision) + obj.logPdfKernel;
        end
        
        % Cumulative distribution function
        function yax = cdf(xax, Mean, Covariance)
            yax = mvncdf(xax, obj.Mean, obj.Covariance);
        end
        
        % Log Cumulative distribution function
        function yax = logCdf(obj, xax)
            yax = log(obj.cdf(xax));
        end
        
        % Random number generator
        function x = rng(Mean, Covariance, size)
            if nargin < 3, size = 1; end
            x1 = obj.unstandardized(normrnd(obj.Mean(1), obj.Covariance(1,1), obj.size));
            newMean = obj.Mean(2) ...
                        + obj.Covariance(2,2) * obj.Correlation ...
                        * ((obj.x1 - obj.Mean(1)) / obj.Covariance(1,1));
            newCovariance = obj.Covariance(2,2)^2 * sqrt(1 - obj.Correlation^2);
            x2 = obj.unstandardized(normrnd(obj.newMean, obj.newCovariance, obj.size));
            x = [x1; x2];
        end
        
        % Deviance
    end
end