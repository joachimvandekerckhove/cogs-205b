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
        function set.Count(obj, value)
             obj.Count_ = length(obj.ObservedRT);
        end
        function set.ObservedRT(obj, ObservedRT)
            obj.ObservedRT = ObservedRT;
            obj.fit = false;
        end
        function Precision = get.ObservedRT(obj)
            Precision = obj.ObservedRT;
        end
        function Count = get.Count(obj)
            Count = length(obj.ObservedRT);
        end       
        function EstimatedAsymptote = get.EstimatedAsymptote(obj)
            if obj.fit
                EstimatedAsymptote = obj.EstimatedAsymptote;
            else
                error ('PowerLawFitter:getEstimatedAsymptote:mustBeFit', 'Model is not fit!')
            end
        end
        function EstimatedRange = get.EstimatedRange(obj)
            if obj.fit
                EstimatedRange = obj.EstimatedRange;
            else
                error ('PowerLawFitter:getEstimatedRange:mustBeFit', 'Model is not fit!')
            end
        end
        function EstimatedExposure = get.EstimatedExposure(obj)
            if obj.fit
                EstimatedExposure = obj.EstimatedExposure;
            else
                error ('PowerLawFitter:getEstimatedExposure:mustBeFit', 'Model is not fit!')
            end
        end        
        function EstimatedRate = get.EstimatedRate(obj)
            if obj.fit
                EstimatedRate = obj.EstimatedRate;
            else
                error ('PowerLawFitter:getEstimatedRate:mustBeFit', 'Model is not fit!')
            end
        end
        ERT = Expectation(obj, A, B, E, b)
        SSE = SumOfSquaredError (obj, A, B, E, b)
        void = Fit(obj)
        void = disp(obj)

    end

        
    
end