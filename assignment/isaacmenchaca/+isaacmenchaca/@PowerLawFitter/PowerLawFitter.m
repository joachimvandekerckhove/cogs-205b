classdef PowerLawFitter < handle
    properties
        ObservedRT(1, :) {mustBePositive, mustBeReal, mustBeFinite}
    end
    properties (Dependent)
        Count
    end
    properties (SetAccess = private)
        EstimatedAsymptote
        EstimatedRange
        EstimatedExposure
        EstimatedRate
        EstimatedLoss
    end
    
    methods
        % Constructor
        function obj = PowerLawFitter(dataRT)            
            if nargin > 0
                obj.ObservedRT = dataRT;
            end
        end
        
        % Setter
        function set.ObservedRT(obj, dataRT)
            obj.ObservedRT = dataRT;
            clearParameters(obj);
        end
        
        % Update Functions
        function clearParameters(obj)
            obj.EstimatedAsymptote = [];
            obj.EstimatedRange = [];
            obj.EstimatedExposure = [];
            obj.EstimatedRate = [];
            obj.EstimatedLoss = [];
        end 
        
        % Getter
        function Count = get.Count(obj)
            Count = length(obj.ObservedRT);
        end
        
        % Ordinary Methods
        function ERT = Expectation(obj, A, B, E, beta)
            t = 1:obj.Count;
            ERT = A + ( B .*  (t + E) .^ ( - beta) );
        end
        
        function SSE = SumOfSquaredError(obj, A, B, E, beta)
            SSE = sum((Expectation(obj, A, B, E, beta) - obj.ObservedRT) .^ (2));
        end
        
        % Methods
        function Fit(obj) % Pass-by-reference.
            
            if isempty(obj.EstimatedAsymptote)
                % initial params
                params0 = [obj.ObservedRT(obj.Count)  ... % last observed should lower asymptote 
                     (obj.ObservedRT(1) - obj.ObservedRT(obj.Count)) ... 
                      1 1]; % start E & beta at 1.

                % SSE function goes through power fitter function.
                objectiveSSE = @(params) SumOfSquaredError(obj, params(1), params(2), params(3), params(4));

                options = optimset('MaxFunEvals', 1e6, 'MaxIter', 1e6);
                [paramsOptimized, fval] = fminsearch(objectiveSSE,params0, options);

                obj.EstimatedAsymptote = paramsOptimized(1);
                obj.EstimatedRange = paramsOptimized(2);
                obj.EstimatedExposure = paramsOptimized(3);
                obj.EstimatedRate = paramsOptimized(4);
                obj.EstimatedLoss = fval;
            
            else
                me = MException('recomputedFit:unchangedData', ...
                                sprintf('Fit() only recomputes upon changed data.'));
                throwAsCaller(me);
            end
            
               
        end
        
        function disp(obj)
            if ~isempty(obj.EstimatedAsymptote)
                fprintf('Power Law of Practice\n\n')
                fprintf('Number of Trials: %7g\n', obj.Count)
                fprintf('Optimal Parameters for Power Law Function:\n')
                fprintf('Asymptote A: %0.3f\n', obj.EstimatedAsymptote)
                fprintf('Range B: %0.3f\n', obj.EstimatedRange)
                fprintf('Exposure E: %0.3f\n', obj.EstimatedExposure)
                fprintf('Rate Beta: %0.3f\n', obj.EstimatedRate)
                fprintf('SSE: %0.3f\n', obj.EstimatedLoss)
            else
                fprintf('\nParameter estimates have not been assigned for this dataset. Please run Fit().\n')
            end
        end

        function plotConvergence(obj)
            plot(Expectation(obj, obj.EstimatedAsymptote, obj.EstimatedRange, obj.EstimatedExposure, obj.EstimatedRate));
            ylabel('RT')
            xlabel('Trial')
            hold on;
            plot(obj.ObservedRT);
            hold off;
            legend('Expected','Observed')
            title('SSE: ' + string(obj.EstimatedLoss))
        end
    end
end

