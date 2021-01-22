classdef Normal
% NORMAL  A class for the normal distribution

    % The main properties are the mean and standard deviation
    properties
        Mean double {mustBeReal, mustBeFinite} = 0
        StandardDeviation double {mustBeReal, mustBeFinite, mustBePositive} = 1
    end
    
    % Derived properties that need to be set internally
    properties (SetAccess = private)
        Precision
        Variance
    end
    
    % The Gaussian scaling constant is sometimes useful
    properties (Constant)
        ScalingConstant = (2*pi).^(-0.5);
    end
    
    
    methods
    
        %%% Constructor function %%%

        % A main constructor, for a new Normal
        function obj = Normal(Mean, StandardDeviation)
            if nargin > 0
                % This triggers the implicit setter for Mean
                obj.Mean = Mean;
                if nargin > 1
                    % This triggers the explicit setter for StandardDeviation
                    obj.StandardDeviation = StandardDeviation;
                end
            end
            obj = updateStandardDeviation(obj);
        end
        
    
        %%% Display function %%%
        
        % Print the distribution to screen
        function disp(obj)
            fprintf('Normal(%g,%g^2)\n', obj.Mean, obj.StandardDeviation);
        end
        
        
        %%% Getters and setters %%%

        % Setter for StandardDeviation
        function obj = set.StandardDeviation(obj, val)
            % Set the value
            obj.StandardDeviation = val;
            % Update contingent properties
            obj = updateStandardDeviation(obj);
        end
        
    end
        
end