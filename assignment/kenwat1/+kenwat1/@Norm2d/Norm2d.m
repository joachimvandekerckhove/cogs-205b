classdef Norm2d
    properties
        Mean(2,1) double {mustBeReal, mustBeFinite}...
            = [0;0]
        Covariance(2,2) double {mustBeReal, mustBeFinite, mustBePositiveOrEye(Covariance), mustBeSymmetric(Covariance)}...
            = eye(2)
    end
    
    properties (SetAccess = private)
        Precision
        Correlation
    end
    
    % The Gaussian scaling constant is sometimes useful
    properties (Constant)
        ScalingConstant = (2*pi).^(-1);
        Name = 'Norm2d';
    end
    
    % Methods are functions that belong to the class
    methods
        %%% Constructor function %%%
        
        % A main constructor, for a new Normal
        function obj = Norm2d(Mean,Covariance)
            if nargin > 0
                obj.Mean = Mean;
                if nargin > 1
                    obj.Covariance = Covariance;
                end
            end
            obj = updateCovariance(obj);
        end
        
        
        %%% Getters and setters %%%
        
        % Setter for StandardDeviation
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
        
        %%% Computation functions %%%
        
        % Probability density function
        function y = pdf(obj,X) % X is a 2 x n matrix
            z = obj.standardize(X);
            y = obj.ScalingConstant ...
                *(sqrt(obj.Covariance(1,1))*(sqrt(obj.Covariance(2,2))))^(-1) ...
                *(sqrt(1-obj.Correlation^2))^(-1) ...
                .* exp(-0.5*(z./(1-obj.Correlation^2)));
        end
        
        % Log Probability density function
        function y = logPdf(obj, X)
            z = obj.standardize(X);
            y = log(obj.ScalingConstant)...
                + (1/(sqrt(obj.Covariance(1,1))*(sqrt(obj.Covariance(2,2)))))...
                + (1/(sqrt(1-obj.Correlation^2)))...
                + (-0.5*(z./(1-obj.Correlation^2)));
        end
        
        % Cumulative distribution function
        function y = cdf(obj, X)
            temp = mvncdf(X',obj.Mean',obj.Covariance');
            y = temp';
        end
        
        % Log Cumulative density function
        function y = logCdf(obj, X)
            p = mvncdf(X',obj.Mean',obj.Covariance');
            y = log(p);
        end
        
        % Random number generator
        function X = rnd(obj, size)
            if nargin < 2, size = [1 1]; end
            x1 = obj.Mean(1)+obj.Covariance(1,1)*randn(1,size);
            newMean = obj.Mean(2)...
                + obj.Covariance(2,2)...
                *obj.Correlation...
                *(x1-obj.Mean(1))./obj.Covariance(1);
            newCovariance = obj.Covariance(2,2)^2*sqrt(1-obj.Correlation^2);
            x2 = newMean + newCovariance*randn(1,size);
            X = [x1;x2];
        end
        
        % Deviance score function
        function yax = deviance(obj, data) % data is a 2 x n matrix
            yax = -2*(sum(obj.logPdf(data))); 
        end
        
        % Standardize a variate
        function z = standardize(obj, X)
            z1 = (X(1,:) - obj.Mean(1))./(sqrt(obj.Covariance(1,1)));
            z2 = (X(2,:) - obj.Mean(2))./(sqrt(obj.Covariance(2,2)));
            z =  z1.^2 - (2*obj.Correlation).*z1.*z2 + z2.^2;
        end
        
    end
    
    % Static methods don't need the object as input
    methods (Static)
        
        testSuite()
        
    end
    
end

%%% Property Validation Functions
function mustBeSymmetric(a)
    if issymmetric(a)==0
        eidType = 'Covariance:notSymmetric';
        msgType = 'Input is not symmetric';
        throwAsCaller(MException(eidType,msgType))
    end
end

function mustBePositiveOrEye(a)    
    if (a(1,1)<=0) || (a(2,2)<=0) || (a(1,2)<0) || (a(2,1)<0)
        eidType = 'Covariance:notPostiveOrEye';
        msgType = 'Input is not positive or eye';
        throwAsCaller(MException(eidType,msgType))
    end
end