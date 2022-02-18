classdef PowerLawFitter < handle
    properties
        ObservedRT double {mustBeReal, mustBeFinite}...
            = [0 0]
    end
    
    properties(Dependent)
        Count
    end
    
    properties (SetAccess = private)
        EstimatedAsymptote
        EstimatedRange
        EstimatedExposure
        EstimatedRate
    end
    
    % Methods
    methods
        %%% Constructor function %%%
        
        % A main constructor
        function obj = PowerLawFitter(ObservedRT)
            if nargin > 0
                obj.ObservedRT = ObservedRT;
            end
        end
        
        %%% Getters and setters %%%
        
        function value = get.Count(obj)
            v = length(obj.ObservedRT);
            value = v;
        end
        
        % Setter for ObservedRT
        function obj = set.ObservedRT(obj, val)
            % Set the value
            obj.ObservedRT = val;
        end
        
%         % Updater for parameters
%         function obj = updateParameters(obj)
%             obj.EstimatedAsymptote  = EstimatedAsymptote;
%             obj.EstimatedRange  = ;
%         end
        
        function obj = Fit(obj)
            obsRT = obj.ObservedRT;
            t = 1:obj.Count;
            f=@(x) sum((x(1)+x(2).*(t + x(3)).^(-1)*x(4))-obsRT)^2;
            x = fminsearch(f,[mean(obsRT),600,1 1]);
            
            obj.EstimatedAsymptote = x(1);
            obj.EstimatedRange = x(2);
            obj.EstimatedExposure = x(3);
            obj.EstimatedRate = x(4);
        end
        
        function ERT = Expectation(obj)
            t = 1:obj.Count;
            ERT = obj.EstimatedAsymptote + obj.EstimatedRange.*(t ...
                + obj.EstimatedExposure).^((-1)*obj.EstimatedRate);
        end
        
        function SSE = SumOfSquaredError(obj)
            SSE = sum((obj.ERT-obj.ObservedRT).^2);
        end
        
        function disp(obj)
            fprintf('The number of trials is: %d\n',obj.Count); 
        end
        
    end
    
end