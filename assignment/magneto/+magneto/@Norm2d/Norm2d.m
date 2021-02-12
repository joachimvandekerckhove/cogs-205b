classdef Norm2d
    % NORMAL  A class for the bivariate normal distribution
    
    % The main properties are the bivariate mean and covariance matrix
    properties
        Mean(2,1) double {mustBeReal,mustBeFinite} = zeros(2,1)
        Covariance(2,2) double {mustBeReal,mustBeFinite} = eye(2)
    end
    
    % Derived properties that need to be set internally
    properties (SetAccess = private)
        Precision
        Correlation
        ScaleFactor
        logScaleFactor
    end
    
    % The Gaussian scaling constant is sometimes useful
    properties (Constant)
        ScalingConstant = 0.159154943091895;
    end
    
    % Methods are functions that belong to the class
    methods
        
        %%% Constructor function %%%
        
        % A main constructor, for a new Norm2d
        function obj = Norm2d(Mean, Covariance)
            % This triggers the implicit setter for Mean
            if nargin > 0
                obj.Mean = Mean;
            else
                obj.Mean = [0;0];
            end
            
            % This triggers the explicit setter for Covariance
            if nargin > 1
                obj.Covariance = Covariance;
            else
                obj.Covariance = eye(2);
            end
        end
        
        
        %%% Display function %%%
        
        % Print the distribution to screen
        function disp(obj)
            fprintf('magneto.Norm2d object\n\n')
            fprintf('         /  | %7g |   | %7g  %7g |  \\\n', obj.Mean(1), obj.Covariance(1,:))
            fprintf('  Normal |  |         | , |                  |  |\n')
            fprintf('         \\  | %7g |   | %7g  %7g |  /\n\n', ...
                obj.Mean(2), obj.Covariance(2,:))
        end
        
        
        %%% Getters and setters %%%        
        
        % Setter for Covariance
        function obj = set.Covariance(obj, val)
            
            obj.isValid2x2Covariance(val);
            
            % Set the value
            obj.Covariance = val;
            % Update contingent properties
            obj = updateCovariance(obj);
        end
        
        
    end
    
    
    methods (Static)
        
        testSuite(pseudonym)
        
    end
    % testSuite don't run if I run "magneto.Norm2d.testSuite"
    % it reports "The class magneto.Norm2d has no Constant property or
    % Static method named 'testSuite'."
end