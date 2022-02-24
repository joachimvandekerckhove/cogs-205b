classdef PowerLawFitter < handle
    %POWERLAWFITTER: The power law of practice says that expected (mean) reaction time ERT
    % decreases according to a power law as a function of number of trials N.
    % ERT = A + B (N + E)^{-beta}
    % PARAMETERS: Asymptote A-Asymptote, B-Range, E-Exposure, Rate-beta
    
    %define properties
    properties
        ObservedRT double {mustBeFinite, mustBeNumeric(ObservedRT), mustBeVector(ObservedRT)}%need to make sure it is a vector
    end
    
    properties (SetAccess=private)
        EstimatedAsymptote
        EstimatedRange
        EstimatedExposure
        EstimatedRate
    end
    
    properties (Dependent)
        Count
    end
    
    % getters
    methods
        function value = get.ObservedRT(obj)
            value=obj.ObservedRT;
        end
        
        function value = get.Count(obj)
            value = obj.Count;
        end
    end
    
    % setters
    methods
        function set.Count(obj,input)
            obj.Count=length(input);
        end
        function set.ObservedRT(obj, input)
            obj.ObservedRT = input;
            % update dependent property
            set.Count(obj, input);
            % update private properties
            obj.fit();
        end
        
    end
    %methods
    
    methods
        function obj = PowerLawFitter(ObservedRT)
            obj.ObservedRT=ObservedRT;
            obj=fit();
        end
        
        function ERT = Expectation(A, B, E, beta)
            A=obj.EstimatedAsymptote;
            B=obj.EstiamtedRange;
            E=obj.EstimatedExposure;
            beta=obj.EstimatedRate;
            N=obj.Count;
            
        end
        
        function SSE = SumOfSquaredError(A, B, E, beta)
            ERT=obj.Expectation(A, B, E, beta); %should it be .fit?
            error=obj.ObservedRT-ERT;
            squaredError=error.^2;
            SSE=sum(squaredError);
            
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
    
    methods (Static)
        function fit() %no input, no output
            obj.Count=length(obj.ObservedRT);
            N=obj.Count;
            for 1:N
                fun=@(x) A + B.*(N+E).^-beta
                x0=mean(obj.ObservedRT);
                x=fminsearch(fun, x0)
            end
        end
    end
    
