classdef PowerLawFitter < handle
    properties
        ObservedRT double {mustBeReal, mustBeFinite, mustBePositive}...
            = [1 1]
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

%         function obj = set.ObservedRT(obj,val) 
%             if any(val<=0)
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
            options = optimset('MaxFunEvals',1e6,'MaxIter',1e6);
            x = fminsearch(g,x0,options);

            params = [obj.EstimatedAsymptote,obj.EstimatedRange, ...
                obj.EstimatedExposure,obj.EstimatedRate];

            if isempty(obj.EstimatedAsymptote)
                obj.EstimatedAsymptote = x(1);
                obj.EstimatedRange = x(2);
                obj.EstimatedExposure = x(3);
                obj.EstimatedRate = x(4);
            elseif all(params==x)
                error('All parameters are already set for this dataset. Terminated Correctly');
            else
                obj.EstimatedAsymptote = x(1);
                obj.EstimatedRange = x(2);
                obj.EstimatedExposure = x(3);
                obj.EstimatedRate = x(4);
            end

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