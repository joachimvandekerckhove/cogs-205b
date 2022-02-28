classdef PowerLawFitter < handle
    % A class for the power law fitter
    
    % The main properties are the observed RT and count
    properties
        ObservedRT (1,:) double {mustBeReal, mustBeFinite, mustBeVector};
    end
    
    % Dependent properties
    properties (Dependent = true)
        Count
    end
    
    % Derived properties that need to be set internally
    properties(SetAccess = private)
        EstimatedAsymptote
        EstimatedRange
        EstimatedExposure
        EstimatedRate
        EstimatedSSE
        PreviousData
    end
    
   
    % Methods are functions that belong to the class
    methods
        
        %%% Constructor function %%%
    
        % A main constructor for the power law fitter
         function obj = PowerLawFitter(ObservedRT, Initial)
            
            % POWERLAW    A main constructor for the power law fitter
                
            % This triggers the implicit setter for ObservedRT
            obj.ObservedRT = ObservedRT;
            
         end
        
        %%% Display function %%%
        
        % Print the information to screen
        function disp(obj)
        
            % DISP    Prints the information to screen
            d = 'Data:      %g observations \n';
            p = 'Parameter Estimates:     \n';
            se = 'Loss:     \n';
            s = '     %-10s = %g \n';
            
            fprintf(d, length(obj.ObservedRT));
            fprintf(s, 'Min(RT)', min(obj.ObservedRT));
            fprintf(s, 'Max(RT)', max(obj.ObservedRT));
            
            fprintf('\n');

            fprintf(p);
            fprintf(s, 'Asymptote', obj.EstimatedAsymptote);
            fprintf(s, 'Range', obj.EstimatedRange);
            fprintf(s, 'Exposure', obj.EstimatedExposure);
            fprintf(s, 'Rate', obj.EstimatedRate);

            fprintf('\n');
            
            fprintf(se);
            fprintf(s, 'SSE', obj.EstimatedSSE);
            
        end
   
        
        %%% Getters and setters %%%

        % Updater for Dependent Properties
        function value = get.Count(obj)
            value = size(obj.ObservedRT, 2);
        end        
        
        
        % Computation functions
        
        % Expectation
        function ERT = expectation(obj, x)
            
            % EXPECTATION    Expectation function
            tempERT = 1:obj.Count;
            
            for i = 1:obj.Count
                tempERT(i) = x(1) + (x(2) * (i + x(3)) ^ (-x(4)));
            end
            
            ERT = tempERT;
            
        end
        
        % SumOfSquaredError
        function val = sse(obj, x)

            % SSE    Sum of squared error function
            val = sum((obj.expectation(x) - obj.ObservedRT).^2);
       
        end
        
        % Fit
        function Fit(obj)
            
            % FIT    Fit function that sets estimated parameters
            
            % stopping from recalculating if values set
            if (isempty(obj.EstimatedAsymptote) == 0) && ...
               all(obj.PreviousData == obj.ObservedRT)
               disp('Parameter values have already been calculated for this data');
               return
            end        
            
            % setting initial values
            initial = [100, 100, 10, 1];
            objective = @(initial) (obj.sse(initial));
            options = optimset('MaxFunEvals', 1e6, 'MaxIter', 1e6);
            [x, fval] = fminsearch(objective, initial, options);
            
            % adding information to output
            obj.EstimatedAsymptote = x(1);
            obj.EstimatedRange = x(2);
            obj.EstimatedExposure = x(3);
            obj.EstimatedRate = x(4);
            obj.EstimatedSSE = fval;
            obj.PreviousData = obj.ObservedRT;
        
        end
                
    end
    
end