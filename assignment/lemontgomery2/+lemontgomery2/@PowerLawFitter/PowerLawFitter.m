classdef PowerLawFitter < handle
    % A class for the power law fitter
    
    % The main properties are the observed RT and count
    properties
        ObservedRT (2,1) double {mustBeReal, mustBeFinite, mustBeVector} ...
            = [ 0; 0 ]
    end
    
    % Dependent properties
    properties (Dependent)
        Count
    end
    
    % Derived properties that need to be set internally
    properties(SetAccess = private)
        EstimatedAsymptote
        EstimatedRange
        EstimatedExposure
        EstimatedRate
    end
    
   
    % Methods are functions that belong to the class
    methods
        
        %%% Constructor function %%%
    
        % A main constructor for the power law fitter
         function obj = PowerLaw(ObservedRT)
            
            % POWERLAW    A main constructor for the power law fitter
                
            % This triggers the implicit setter for Mean
            obj.ObservedRT = ObservedRT;
         end
        
        %%% Display function %%%
        
        % Print the distribution to screen

        
        % Print the distribution to screen

        
        %%% Getters and setters %%%

        % Updater for Dependent Properties
        function value = get.Count(obj)
            value = size(obj.ObservedRT, 1);
        end        
        
        % Updater for Derived Properties
        function obj = updateCovariance(obj)
            
            % UPDATECOVARIANCE    Corresponding updated for covariance
            obj.Precision = inv(obj.Covariance);
            obj.Correlation = obj.Covariance(1,2) ...
                              / (sqrt(obj.Covariance(1,1)) ...
                              * sqrt(obj.Covariance(2,2)));
        end        
        % Computation functions
        
        % Expectation
        
        % SumOfSquaredError
        
        % Fit
        
        % Disp
        
    end
    
end