classdef PowerLawFitter
    %POWERLAWFITTER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        ObservedRT(1, :) {mustBePositive} % a row vector of observed mean reaction times over N trials 
    end
    
    properties (Dependent)
        Count % a scalar giving the number of trials in MeanRT
    end
    
    properties (SetAccess = private)
        EstimatedAsymptote
        EstimatedRange
        EstimatedExposure
        EstimatedRate
    end
    
    methods
        function obj = PowerLawFitter(dataRT)
            %POWERLAWFITTER Construct an instance of this class
            
            if nargin > 0
                obj.ObservedRT = dataRT;
            end
        end
        
        
        function Count = get.Count(obj)
            Count = length(obj.ObservedRT);
        end
        
        function ERT = Expectation(obj, A, B, E, beta)
            t = 1:obj.Count;
            ERT = A + ( B .*  (t + E) .^ ( - beta) );
        end
        
        function SSE = SumOfSquaredError(obj, A, B, E, beta)
            SSE = sum((Expectation(obj, A, B, E, beta) - obj.ObservedRT) .^ (2));
        end
        
        function Fit(obj)
            params0 = [obj.ObservedRT(obj.Count)  ... % last observed should be smallest RT, lower 
                 (obj.ObservedRT(1) - obj.ObservedRT(obj.Count)) ... 
                  1 1]; % start E & beta at 1.
            % SSE function goes thru power fitter function.
            objectiveSSE = @(params) SumOfSquaredError(obj, params(1), params(2), params(3), params(4));
            options = optimset('MaxFunEvals', 1e6, 'MaxIter', 1e6);
            [paramsOptimized, fval] = fminsearch(objectiveSSE,params0);
            
            display(paramsOptimized)
            plot(Expectation(obj, paramsOptimized(1), paramsOptimized(2), paramsOptimized(3), paramsOptimized(4)))
            hold on;
            plot(obj.ObservedRT)
           
        end
    end
end

