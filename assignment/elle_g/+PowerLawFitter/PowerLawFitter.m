classdef PowerLawFitter < handle
    %POWERLAWFITTER: The power law of practice says that expected (mean) reaction time ERT
    % decreases according to a power law as a function of number of trials N.
    % ERT = A + B (N + E)^{-beta}
    % PARAMETERS: Asymptote A-Asymptote, B-Range, E-Exposure, Rate-beta
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
            %define obj?
            obj.Count=length(obj.ObservedRT);
            obj.EstimatedAsymptote %NEED TO USE NELDER-MEAD?
            obj.EstimatedRange=range(obj.ObservedRT);
            obj.EstimatedExposure %what is exposure? watch recording
            obj.EstimatedRate %is rate just mean? watch recording
        end
        
        function disp() %no input, no putput
            % number of trials, 
            % and also parameter estimates if they are available.
            fprintf('Generating a report about the current data ...') 
            pause(1)
            formSpecN='The current data set has %i sets of trials';
            formSpecA='The asymptote of the current data set is ';
            formSpecB='The current data set has a range of ';
            formSpecE='The estimated exposure of this data set is ';
            formSpecBeta='The rate of the current data set is ';
            fprintf(formSpecN, obj.Count)
            fprintf(formSpecA, obj.EstimatedAsymptote)
            fprintf(formSpecB, obj.EstimatedRange)
            fprintf(formSpecE, obj.EstimatedExposure)
            fprintf(formSpecBeta, obj.EstimatedRate)
            
        end
    end
end

