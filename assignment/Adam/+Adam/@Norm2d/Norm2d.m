classdef Norm2d
% Norm2d  A class for the bivariate normal likelihood equivalence

    % The main properties are Mean (2x1 vector) and Covariance (2x2 matrix)
    properties
        Mean (2,1) double {mustBeReal, mustBeFinite} = [0; 0];
        Covariance (2,2) double {mustBeReal, mustBeFinite} = eye(2);
    end
    
    % Derived properties that need to be set internally
    % Precision: A matrix that is the inverse of covariance
    % Correlation
    properties (SetAccess = private)
        Precision 
        Correlation
    end

    % The  scaling constant
    properties (Constant)
        ScalingConstant = (2*pi).^(-1);
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
                    % This triggers the explicit setter for Covariance
                    obj.Covariance = Covariance;
                end
            end
            obj = updateCovariance(obj);
        end
        
    
        %%% Display function %%%
        
        % Print the distribution to screen
        function disp(obj)
            fprintf('Adam.Norm2d(%g,%g^2)\n', obj.Mean, obj.Covariance);
        end
        
        
        %%% Getters and setters %%%

        % Setter for Covariance
        function obj = set.Covariance(obj, val)
            % Set the value
            obj.Covariance = val;
            % Update contingent properties
            obj = updateCovariance(obj);
        end
        
    end
    

        
end
