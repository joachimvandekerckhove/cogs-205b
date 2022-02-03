classdef Norm2d
    % Norm2d: A class for the bivariate Normal distribution.
    
    % Main properties
    properties
        Mean       (2,1) double {mustBeReal, mustBeFinite} ...
            = zeros(2,1);
        Covariance (2,2) double {mustBeReal, mustBeFinite, mustBePosDef(Covariance), mustBeSymm(Covariance)} ...
            = eye(2);
    end
    
    % Derived properties that are not accessible to the user
    properties (SetAccess = private)
        Precision;
        Correlation;
        ScaleFactor;
        logScaleFactor;
    end
    
    % Gaussian scaling constant
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
            end
            if nargin > 1                    
                obj.Covariance = Covariance;
            end            
        end

        %%% Display function %%%
        % Print the distribution to screen
        function disp(obj)
            fprintf('adri.Norm2d object\n\n')
            fprintf('         /  | %7g |   | %7g  %7g |  \\\n', obj.Mean(1), obj.Covariance(1,:))
            fprintf('  Normal |  |         | , |                  |  |\n')
            fprintf('         \\  | %7g |   | %7g  %7g |  /\n\n', ...
                obj.Mean(2), obj.Covariance(2,:))
        end
              
        %%% Getters and setters %%%        
        % Setter for the Covariance Matrix
        function obj = set.Covariance(obj, val)
            % Set the value
            obj.Covariance = val;
            % Update contingent properties
            obj = updateMatrix(obj);
        end
        
        %%% Computation functions %%%
        % Standardize a variate %
        function z = standardize(obj,x)
            x1 =  x(1)
            x2 =  x(2)
            mu1 = obj.Mean(1)
            mu2 = obj.Mean(2)
            sigma1 = sqrt(obj.Covariance(1,1))
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