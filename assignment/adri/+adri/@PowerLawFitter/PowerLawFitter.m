classdef PowerLawFitter < handle 
    % PowerLawFitter: A class for optimizing and estimating 
    % the parameters in the Power Law of Practice.
    
    % Main property
    properties
        ObservedRT double %{mustBeReal, mustBePositive, mustBeVector}
    end
    
    % Derived properties that are not accessible to the user
    properties (SetAccess = private)
        Count;
        EstimatedAsymptote;  %Hundreds
        EstimatedRange;      %Hundreds
        EstimatedExposure;   %Small number of sesions
        EstimatedRate;       %Not much bigger than 1
        CurrentlyInMemory;
    end
        
    % Methods
    methods
        %%% Constructor function %%%        
        % A main constructor
        function obj = PowerLawFitter(data)
            if nargin < 1                
               error('ERROR: No data has been provided');
            end    
            if nargin > 0                
                obj.ObservedRT = data;            
                obj.Count = size(data,2);
                obj.EstimatedAsymptote = [];
                obj.CurrentlyInMemory = obj.EstimatedAsymptote;
            end            
        end

        %%% Display function %%%
        % Print a little message to screen
        function disp(obj)
            line = repmat('-', 1, 73);
            fprintf('adri.PowerLawFitter class\n\n')
            fprintf('*%s*\n', line);            
            fprintf("Input:\n")            
            fprintf("A vector with %1g observations (mean RTs)\n", obj.Count)
            fprintf("Maximum mean RT observed: %3g\n", max(obj.ObservedRT))
            fprintf("Minimum mean RT observed: %3g\n", min(obj.ObservedRT))
            fprintf('*%s*\n', line);
            fprintf("Output:\n")
            if isempty(obj.EstimatedAsymptote)
                fprintf("Run the myFit function to get parameter estimates\n")
            else
                fprintf("Parameter values estimated from these data:\n")
                fprintf("Asymptote: %6.3f ms\n", obj.EstimatedAsymptote)
                fprintf("Range: %6.3f ms\n", obj.EstimatedRange)
                fprintf("Exposure: %4.3f\n", obj.EstimatedExposure)
                fprintf("Rate: %4.3f\n", obj.EstimatedRate)
            end
        end              
    end    
end