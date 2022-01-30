classdef Norm2d
    % Assignment 2: Creating a Norm2d class
        
    % Mean is now a vector and we replace the S.D with a Covariance Matrix
    properties
        Mean (2,1) double {mustBeReal, mustBeFinite} ...
            = zeros(2,1);
        Covariance (2,2) double {mustBeReal, mustBeFinite, mustBeSymm(Covariance)} ...
            = eye(2);
        % （1）
        % Here I think you don't need to include the variable into the
        % mustBeSymm function, mustBeSymm() should be okay to work；
        % （2）
        % you also need to make sure the variance is larger than zero and
        % covariance is larger/equal to zero.
    end
    
    % Derived properties that are not changeable by the user
    properties (SetAccess = private)
        Precision;
        Correlation;
    end
    
    % We keep the Gaussian scaling constant
    properties (Constant)
        ScalingConstant = (2*pi).^(-0.5);
        Name = '2D-Normal';
    end
        
    methods        
        %%% Constructor function %%%        
        % A main constructor, for a new 2D-Normal
        function obj = Norm2d(Mean, Covariance)
            if nargin > 0                
                obj.Mean = Mean;
                if nargin > 1                    
                    obj.Covariance = Covariance;
                end
            end
            obj = updateMatrix(obj);
        end
              
        %%% Getters and setters %%%        
        % Setter for the Covariance Matrix
        function obj = set.Covariance(obj, val)
            % Set the value
            obj.Covariance = val;
            % Update contingent properties
            obj = updateMatrix(obj);
        end

        function obj = updateMatrix(obj)
            obj.Precision = inv(obj.Covariance);
            obj.Correlation = obj.Covariance(1,2) / sqrt(obj.Covariance(1,1)*obj.Covariance(2,2));
        end
        
        %%% Computation functions %%%
        % Cumulative distribution function
        function Fx = cdf(obj, x)            
            Fx = mvncdf(x', obj.Mean.', obj.Covariance)';
            Fx = Fx.';
        end

        % Log cumulative density function
        function logF = logcdf(obj, x)            
            logF = log(cdf(obj,x));
        end

        % Probability density function
        function fx = pdf(obj, x)
            sigma1 = sqrt(obj.Covariance(1,1))
            % please see comments in the rnd function below
            sigma2 = sqrt(obj.Covariance(2,2))
            rho = obj.Correlation

            fx= (1/(2*pi*sigma1*sigma2*sqrt(1-rho^2))) ...
                * exp((-1/2)*(obj.standardize(x)/(1-(rho^2))));
            % uninterpretable, you can try to break this equation into
            % multiple ones for easier reading
        end
        
        % Log Probability density function
        function logf = logPdf(obj, x)
            logf = -0.5 * (obj.standardize(x) / (1 - obj.Correlation ^ 2)) * ...
                log( 1 / (2 * pi * obj.sigma1 * obj.sigma2 * ...
                sqrt(1 - obj.Correlation ^ 2)));
            % same comments as above:
            % uninterpretable, you can try to break this equation into
            % multiple ones for easier reading
        end
       
        % Deviance score function
        function dev = deviance(obj, data)            
            dev = - 2 * sum(obj.logPdf(data'));
            if ~isscalar(dev)
                error('Deviance is not a scalar');
            end
        end
        
        % Random number generator
        function rndm = rnd(obj, dims)            
            if nargin < 2, dims = 1; end            
            mu1 = obj.Mean(1)
            mu2 = obj.Mean(2)
            sigma1 = sqrt(obj.Covariance(1,1))
            % here sigma1 and sigma2 is redundancy as the pdf function,
            % you can set them as a property so that all the functions can
            % get access to it without recalculation
            sigma2 = sqrt(obj.Covariance(2,2))
            rho = obj.Correlation;
            x1 = sigma1 * randn(1,dims) + mu1
            x2 = (sigma2^2*sqrt(1-rho)) * randn(1,dims) + ...
                (mu2+sigma2*rho*((x1-mu1)./sigma1));
            rndm = horzcat(x1,x2)
        end

        % Standardize a variate %
        function z = standardize(obj,x)
            x1 =  x(1)
            x2 =  x(2)
            mu1 = obj.Mean(1)
            mu2 = obj.Mean(2)
            sigma1 = sqrt(obj.Covariance(1,1))
            % same comments here as above: sigma1 and sigma2 are redundancy
            sigma2 = sqrt(obj.Covariance(2,2))
            rho = obj.Correlation;
            z = ((x1-mu1)/sigma1)^2 - (2*rho)*(((x1-mu1)/sigma1) * ...
                ((x2-mu2)/sigma2)) + ((x2-mu2)/sigma2)^2;
        end
        
    end
    
    
    % Static methods don't need the object as input
    methods (Static)

        testSuite()
        
    end
    
end

    % Customized property validation function for the Covariance matrix
function mustBeSymm(a)
    if ~issymmetric(a)
        errID = 'Not symmetric';
        msgText = 'The inserted Covariance matrix is not symmetric';
        throwAsCaller(MException(errID,msgText))
    end
end