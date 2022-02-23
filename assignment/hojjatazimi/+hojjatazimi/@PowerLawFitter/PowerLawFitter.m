classdef PowerLawFitter
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here

    properties
        ObservedRT
       
    end

    properties (Dependent)
        Count
    end

    properties (Access = private)
        EstimatedAsymptote
        EstimatedRange
        EstimatedExposure
        EstimatedRate
    end

    methods
        function obj = PowerLawFitter(ObservedRT)
            if nargin > 0
                obj.ObservedRT = ObservedRT;
                obj.Count = length(ObservedRT)
            end
        end

        ERT = Expectation(obj, A, B, E, b)
    end
end