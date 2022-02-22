classdef PowerLawFitter < handle
    properties
        ObservedRT double {mustBeReal, mustBeFinite, mustBePositive}...
            = [1 1]
    end
    
    properties(Dependent)
        Count
    end
    
    properties (SetAccess = private)
        EstimatedAsymptote {mustBeReal,mustBePositive}
        EstimatedRange {mustBeReal,mustBePositive}
        EstimatedExposure {mustBeReal,mustBePositive}
        EstimatedRate {mustBeReal,mustBePositive}
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
        
%         % Setter for ObservedRT
%         function obj = set.ObservedRT(obj,val)
%             % obj: object whose property is being assigned a value
%             % val: the new value that is assigned
%             % Then when obj.ObservedRT = val, Fit should not recompute
%             % unless the data changes
%             if isequal(obj.ObservedRT,val)
%                 disp('The parameters estimates are already set for this data.')
%                 disp('No need to recompute')
%             elseif any(val<=0)
%                 error('Reaction times have to be positive!')
%             else
%                 obj.ObservedRT = val;
%             end
%         end
        
        function Fit(obj)
            obsRT = obj.ObservedRT;
            t = 1:obj.Count;
            f=@(x) x(1) + x(2).*((t + x(3)).^(-x(4)));
            g=@(x) sum((f(x)-obsRT).^2);
            x0 = [250,600,7,1];
            x = fminsearch(g,x0);
            
            obj.EstimatedAsymptote = x(1);
            obj.EstimatedRange = x(2);
            obj.EstimatedExposure = x(3);
            obj.EstimatedRate = x(4);
        end
        
        function ERT = Expectation(obj) 
            t = 1:obj.Count;
            ERT = obj.EstimatedAsymptote + obj.EstimatedRange ...
                .*((t + obj.EstimatedExposure).^(-obj.EstimatedRate));
        end
        
        function SSE = SumOfSquaredError(obj)
            ERT = Expectation(obj);
            SSE = sum((ERT-obj.ObservedRT).^2);
        end
        
        function disp(obj)
            SSE = SumOfSquaredError(obj);
            fprintf('The number of observations: %d\n',obj.Count);
            fprintf('\tMax RT: %d\n',max(obj.ObservedRT));
            fprintf('\tMin RT: %d\n\n',min(obj.ObservedRT));
            fprintf('Parameter estimates:\n');
            fprintf('\tAsymptote: %1.2f\n',obj.EstimatedAsymptote);
            fprintf('\tRange: %1.2f\n',obj.EstimatedRange);
            fprintf('\tExposure: %1.2f\n',obj.EstimatedExposure);
            fprintf('\tRate: %1.2f\n\n',obj.EstimatedRate);
            fprintf('Loss:\n');
            fprintf('\tSSE: %1.2f\n\n',SSE);
        end
    end
end