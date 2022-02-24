classdef PowerLawFitter < handle
    %POWERLAWFITTER: The power law of practice says that expected (mean) reaction time ERT
    % decreases according to a power law as a function of number of trials N.
    % ERT = A + B (N + E)^{-beta}
    % PARAMETERS: Asymptote A-Asymptote, B-Range, E-Exposure, Rate-beta
    % So you start with 4 parameters.
    % With those you generate 25 expected data points.
    % Then you calculate 25 "error" values by taking the difference
    % between your 25 predicted points and your 25 observed points.
    % Then you take the square of those 25 errors and add them together to get 1 SumOfSquaredError (SSE)
    % Then fminsearch finds that set of 4 parameters for which the SSE is minimal.
    
    properties
        ObservedRT double {mustBeFinite, mustBeNumeric(ObservedRT), mustBeVector(ObservedRT)}
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
        % constructor
        function obj = PowerLawFitter(ObservedRT)
            obj.ObservedRT=ObservedRT;
        end
        
        function ERT = Expectation(A, B, E, beta)
            N=obj.Count;
            ERT=ones(1, N);
            for index=1:N
                ERT(index)= A + B.*(index+E).^-beta;
            end
        end
        
        function SSE = SumOfSquaredError(A, B, E, beta)
            if nargin < 2
                A = min(obj.ObservedRT);
                B =max(obj.ObservedRT)-min(obj.ObservedRT);
                E = 4;
                beta = 1;
            end
            ERT=obj.Expectation(A, B, E, beta);
            error=obj.ObservedRT-ERT;
            squaredError=error.^2;
            SSE=sum(squaredError);
            
        end
        
                function disp(obj) %no input, no putput
                    % number of trials,
                    % and also parameter estimates if they are available.
                    fprintf('Generating a report about the current data ...\n')
                    pause(1)
                    formSpecN='The current data set has %i sets of trials';
                    formSpecA='The estimated asymptote is %f4\n';
                    formSpecB='The estimated range is %f4\n';
                    formSpecE='The estimated exposure is %f4\n';
                    formSpecBeta='The estimated rate is %f4\n';
                    fprintf(formSpecN, obj.Count)
                    fprintf(formSpecA, obj.EstimatedAsymptote)
                    fprintf(formSpecB, obj.EstimatedRange)
                    fprintf(formSpecE, obj.EstimatedExposure)
                    fprintf(formSpecBeta, obj.EstimatedRate)
                end
    end
    
    methods (Static)
        function fit(obj) %no input, no output
            obj.Count=length(obj.ObservedRT);
            N=obj.Count;
            fun=@(A, B, E, beta) ((A + B.*(N+E).^-beta)-obj.ObservedRT).^2;
            presetParameters=[min(obj.ObservedRT), (max(obj.ObservedRT)-min(obj.ObservedRT)), 4, 1];
            x=fminsearch(fun, presetParameters);
            obj.EstimatedAsymptote=x(1);
            obj.EstimatedRange=x(2);
            obj.EstimatedExposure=x(3);
            obj.EstimatedRate=x(4);
        end
    end
end

