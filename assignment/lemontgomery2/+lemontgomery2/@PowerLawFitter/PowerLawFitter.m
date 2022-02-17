classdef PowerLawFitter < handle
    % A class for the power law fitter
    
    % The main properties are the observed RT and count
    properties
        ObservedRT (2,1) double {mustBeReal, mustBeFinite, mustBeVector} ...
            = [ 0; 0 ]
        Count (2,2) double {mustBeReal, mustBeFinite} ...
            = eye(2)
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
    
        % A main constructor, for a new Bivariate Normal
 
        %%% Display function %%%
        
        % Print the distribution to screen

        
        % Print the distribution to screen

        
        %%% Getters and setters %%%

        % Setter for Covariance


        % Updater for Covariance
        
        
        
        % Computation functions
        
        % Expectation
        
        % SumOfSquaredError
        
        % Fit
        
        % Disp
        
    end
    
end