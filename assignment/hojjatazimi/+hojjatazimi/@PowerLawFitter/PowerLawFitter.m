classdef PowerLawFitter < handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here

    properties
        ObservedRT
       
    end

    properties (Dependent)
        Count
    end

    properties (Access = private)
        Count_
        EstimatedAsymptote
        EstimatedRange
        EstimatedExposure
        EstimatedRate
        fit = false
    end

    methods
        function obj = PowerLawFitter(ObservedRT)
            if nargin > 0
                obj.ObservedRT = ObservedRT;
                obj.Count = length(ObservedRT);
            end
        end
        function obj = set.Count(obj, value)
             obj.Count_ = length(obj.ObservedRT);
        end
        function Precision = get.ObservedRT(obj)
            Precision = obj.ObservedRT;
        end
        function Count = get.Count(obj)
            Count = length(obj.ObservedRT);
        end        
        ERT = Expectation(obj, A, B, E, b)
        SSE = SumOfSquaredError (obj, A, B, E, b)
        void = Fit(obj)
    end

        
    
end