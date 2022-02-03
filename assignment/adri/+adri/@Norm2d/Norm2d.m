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
    end    
    
    % Static methods don't need the object as input
    methods (Static)
        % Estimating the mean and covariance of some data
        function theseData = estimate(matrix)
            theseData = adri.Norm2d();
            theseMeans = theseData.estMean(matrix);
            theseData.Mean = theseMeans; 
            thisCov = theseData.estCovariance(matrix);
            theseData.Covariance = thisCov;
        end

        function getMean = estMean(matrix)            
            getMean = mean(matrix,1);
        end

        function getCov = estCovariance(matrix)
            matrix = matrix'
            n = size(matrix,2);            
            z = zeros(2,n);            
            barx = mean(matrix,2);
            for i = 1:n
                z(:,i) = matrix(:,i) - barx;
            end            
            getCov = 1./(n-1) .* (z * z.');
        end
    end
    
end