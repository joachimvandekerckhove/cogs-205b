classdef Norm2d
    % a class for the bivariate normal distribution
    
    % The main properties are the mean, covariance, precision, and correlation
    properties
        Mean (2,1) double {mustBeReal, mustBeFinite, mustBeVector} ...
            = [ 0; 0 ]
        Covariance (2,2) double {mustBeReal, mustBeFinite, ...
                                 mustBePositiveDefinite(Covariance)} ...
            = eye(2)
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
        yax = pdf(obj, xax)
        
        % Log Probability density function
        yax = logpdf(obj, xax)
        
        % Cumulative distribution function
        yax = cdf(obj, xax)
        
        % Log Cumulative distribution function
        yax = logcdf(obj, xax)
        
        % Random number generator
        x = rnd(obj, size)
        
        % Deviance
        dev = deviance(obj, data)
        
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
