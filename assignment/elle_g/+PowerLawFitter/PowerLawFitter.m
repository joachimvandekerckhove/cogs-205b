classdef PowerLawFitter < handle
    %POWERLAWFITTER: The power law of practice says that expected (mean) reaction time ERT
    % decreases according to a power law as a function of number of trials N.
    % ERT = A + B (N + E)^{-beta}
    % PARAMETERS: Asymptote A-Asymptote, B-Range, E-Exposure, Rate-beta
    % Implement at least one test for each property.
    properties
        ObservedRT double {mustBeFinite, mustBeNumeric(ObservedRT), mustBeVector(ObservedRT)}%need to make sure it is a vector
    end
    
    properties (SetAccess=private)
        Count
        EstimatedAsymptote
        EstimatedRange
        EstimatedExposure
        EstimatedRate
    end
    
    methods
        function obj = PowerLawFitter(ObservedRT)
            obj.ObservedRT=ObservedRT;
            obj=fit();
        end
        
        
        function ERT = Expectation(A, B, E, beta)
            N=obj.Count;
            ERT= A + B.*(N+E).^beta;
        end
        
        function SSE = SumOfSquaredError(A, B, E, beta)
            ERT=obj.Expectation(A, B, E, beta);
            error=obj.ObservedRT-ERT;
            squaredError=error.^2;
            SSE=sum(squaredError);
            
        end
    end
    
    methods (Static)
        function fit() %no input, no output
            obj.Count=length(obj.ObservedRT);
            obj.EstimatedAsymptote %NEED TO USE NELDER-MEAD?
            obj.EstimatedRange=range(obj.ObservedRT);
            obj.EstimatedExposure %what is exposure? watch recording
            obj.EstimatedRate %is rate just mean? watch recording
        end
        
        function disp() %no input, no putput
            
        end
    end
end

