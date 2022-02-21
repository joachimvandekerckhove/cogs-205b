classdef PowerLawFitter < handle 
    % PowerLawFitter: A class for optimizing and estimating 
    % the parameters in the Power Law of Practice.
    
    % Main property
    properties
        ObservedRT double %{mustBeReal, mustBePositive, mustBeVector}
    end
    
    % Derived properties that are not accessible to the user
    properties (SetAccess = private)
        Count;               %No. of sessions
        EstimatedAsymptote;  % A
        EstimatedRange;      % B
        EstimatedExposure;   % E
        EstimatedRate;       % Beta
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

        %%% Getters and setters %%%        
        % Setter for the ObservedRT data
        function set.ObservedRT(obj, val)
            % Set the value
            obj.ObservedRT = val;
            % Update contingent properties
            resetProperties(obj);
        end   
    end    
end