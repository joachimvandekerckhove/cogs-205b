classdef Norm2d
% NORM2D  A class for the bivariate normal distribution

    % The main properties are the mean and standard deviation
    properties
        Mean(2,1) double {mustBeReal, mustBeFinite} = [0 0];
        Covariance(2,2) double {mustBeReal, mustBeFinite} = eye(2);
    end
    
    % Derived properties that need to be set internally
    properties (SetAccess = private)
        Precision;
        StandardDev;
        Correlation;
    end
    


    methods
        %%% Constructor function %%%
        % A main constructor, for a new Normal2d
        function obj = Norm2d(Mean, Covariance)
            if nargin > 0
                % This triggers the implicit setter for Mean
                obj.Mean = Mean;
                if nargin > 1
                    % This triggers the explicit setter for Covar
                    obj.Covariance = Covariance;
                end
            end
            obj = updateCovariance(obj);
        end
        
        
        %%% Getters and setters %%%
        % Getter for Mean
        function val = get.Mean(obj)
           val = obj.Mean; 
        end
        % Getter for Covariance
        function val = get.Covariance(obj)
           val = obj.Covariance; 
        end        
        % Getter for Precison
        function val = get.Precision(obj)
           val = obj.Precision; 
        end
        % Getter for Correlation 
        function val = get.Correlation(obj)
           val = obj.Correlation; 
        end        
        % Setter for Mean
        function obj = set.Mean(obj, val)
            obj.Mean = val;
        end
        % Setter for Covariance
        function obj = set.Covariance(obj, val)
            % Should i handle cases where val is a scalar representing 
            % correlation, and keeping variances =1? 
            
            % Set the value
            obj.Covariance = val;
            % Update contingent properties
            obj = updateCovariance(obj);
        end
        
    end    
        
end
