classdef Norm2d
    % NORMAL  A class for the bivariate normal distribution
    
    % The main properties are the mean, covariance, precision, and correlation
    properties
        Mean (2,1) double {mustBeReal, mustBeFinite, mustBeVector} ...
            = [ 0; 0 ]
        Covariance (2,2) double {mustBeReal, mustBeFinite, ...
                                 mustBePositiveDefinite(Covariance)} ...
            = [ 1 0; 0 1 ]
    end
    
    % Derived properties that need to be set internally
    properties(SetAccess = private)
        Precision
        Correlation
    end
    
    % The Gaussian scaling constant is sometimes useful
    properties (Constant)
        ScalingConstant = (2 * pi).^(-1);
        Name = 'Bivariate Normal';
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
        function disp(obj)
        
            t = sprintf('+');
            b = sprintf('+');
            k = sprintf('[');

            
            f = '     %s  %-20s=%8.4s %g ; %g ]\n';
            h = '     %s  %-20s=%8.4s %g %g ; %g %g ]\n';
            
            fprintf('  %s distribution with parameters:\n', obj.Name);

            fprintf(f, t, 'Mean'              , k,  obj.Mean              );
            fprintf(h, b, 'Covariance', k, obj.Covariance );

            
            fprintf('\n');
            
        end
        
        % Print the distribution to screen
        function str = print(obj)
        
            t = sprintf('+');
            b = sprintf('+');
            k = sprintf('[');

            
            f = '     %s  %-20s=%8.4s %g ; %g ]\n';
            h = '     %s  %-20s=%8.4s %g %g ; %g %g ]\n';

            str = sprintf('%s%s%s', ...
                sprintf('  %s distribution with parameters:\n', obj.Name), ...
                sprintf(f, t, 'Mean'              , k, obj.Mean              ), ...
                sprintf(h, b, 'Covariance', k, obj.Covariance ));
            
        end
        
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
                              / (sqrt(obj.Covariance(1,1)) ...
                              * sqrt(obj.Covariance(2,2)));
        end
        
        
        % Computation functions
        
        % Probability density function
        function yax = pdf(obj, xax)
            zax = ((xax(1,:) - obj.Mean(1)) / sqrt(obj.Covariance(1,1))).^2 ...
                  + (((xax(1,:) - obj.Mean(1)) / sqrt(obj.Covariance(1,1))) ...
                  .* ((xax(2,:) - obj.Mean(2)) / sqrt(obj.Covariance(2,2))) ...
                  .* (-2 * obj.Correlation)) ...
                  + ((xax(2,:) - obj.Mean(2)) / sqrt(obj.Covariance(2,2))).^2;
            yax = obj.ScalingConstant ...
                * (sqrt(obj.Covariance(1,1)) * sqrt(obj.Covariance(2,2)))^(-1) ...
                * sqrt(1 - obj.Correlation^2)^(-1) ...
                * exp(-0.5 * zax * (1 - obj.Correlation^2)^(-1));
        end
        
        % Log Probability density function
        function yax = logpdf(obj, xax)
            zax = ((xax(1,:) - obj.Mean(1)) / sqrt(obj.Covariance(1,1)))^2 ...
                  - 2 * obj.Correlation ...
                  * ((xax(1,:) - obj.Mean(1)) / sqrt(obj.Covariance(1,1))) ...
                  * ((xax(2,:) - obj.Mean(2)) / sqrt(obj.Covariance(2,2))) ...
                  + ((xax(2,:) - obj.Mean(2)) / sqrt(obj.Covariance(2,2)))^2;
            yax = pi * sqrt(obj.Covariance(1,1)) * sqrt(obj.Covariance(2,2)) ...
                  * (1 - obj.Correlation^2)^(-0.5) * zax;
        end
        
        % Cumulative distribution function
        function yax = cdf(obj, xax)
            yax = mvncdf(xax, obj.Mean, obj.Covariance);
        end
        
        % Log Cumulative distribution function
        function yax = logcdf(obj, xax)
            yax = log(obj.cdf(xax));
        end
        
        % Random number generator
        function x = rng(obj, size)
            xval1 = normrnd(obj.Mean(1), sqrt(obj.Covariance(1,1)), [1, size]);
            xval2 = normrnd(obj.Mean(2) + sqrt(obj.Covariance(2,2)) * obj.Correlation ...
                        .* ((xval1 - obj.Mean(1)) ./ sqrt(obj.Covariance(1,1))), ...
                        obj.Covariance(2,2)^2 * sqrt(1 - obj.Correlation^2), ...
                        [1, size]);
            x = [xval1; xval2];
        end
        
        % Deviance
        function dev = deviance(obj, data)
            dev = -2 * sum(obj.logpdf(obj, data));
        end
    end
end

% Custom validation function
function mustBePositiveDefinite(Covariance)
    if ~ismatrix(chol(Covariance))
        eidType = 'ImData:notPositiveDefinite';
        msgType = 'Covariance must be positive definite array';
        throwAsCaller(MException(eidType,msgType))
    end
end

% Custom validation function
function mustBeRows(Mean)
    if size(Mean, 1) ~=2
        eidType = 'ImData:notCorrectRows';
        msgType = 'Mean must have 2 rows and n columns';
        throwAsCaller(MException(eidType,msgType))
    end
end
