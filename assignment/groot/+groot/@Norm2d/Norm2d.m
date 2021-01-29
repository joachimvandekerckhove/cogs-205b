classdef Norm2d
% NORM2D  A class for the bivariate normal distribution

    % The main properties are the mean and standard deviation
    properties
        Mean double {mustBeReal, mustBeFinite} = [0;0]
        Covar double {mustBeReal, mustBeFinite, mustBePositive} = diag([1,1])
    end
    
    % Derived properties that need to be set internally
    properties (SetAccess = private)
        Precision % 1/variance
        Variance
    end
    


    methods
        %%% Constructor function %%%
        % A main constructor, for a new Normal
        function obj = Norm2d(Mean, Covar)
            if nargin > 0
                % This triggers the implicit setter for Mean
                obj.Mean = Mean;
                if nargin > 1
                    % This triggers the explicit setter for Covar
                    obj.Covar = Covar;
                end
            end
            obj = updateCovar(obj);
        end
        
    
        %%% Display function %%%
        
        % Print the distribution to screen
        function disp(obj)
            fprintf('groot.Normal(%g,%g^2)\n', obj.Mean, obj.Covar);
        end
        
        
        %%% Getters and setters %%%

        % Setter for Covar
        function obj = set.Covar(obj, val)
            % Set the value
            obj.Covar = val;
            % Update contingent properties
            obj = updateCovar(obj);
        end
        
    end
        
end
