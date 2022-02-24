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
        ObservedRT double {mustBeFinite, mustBeNumeric(ObservedRT), mustBeVector(ObservedRT)}=[1 1]
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
            value = length(obj.ObservedRT);
        end
    end
    
    % setters
    methods
        function set.ObservedRT(obj, input)
            obj.ObservedRT = input;
        end
        
    end
    %methods
    
    methods
        % constructor
        function obj = PowerLawFitter(ObservedRT)
            if nargin < 1
                ObservedRT=[ 313 306 300 293 287 288 285 281 279 275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263 ];
            end
            obj.ObservedRT=ObservedRT;
        end
        
        function ERT = Expectation(A, B, E, beta)
            N=obj.Count;
            ERT=ones(1, N);
            for index=1:N
                ERT(index)= A + B.*(index+E).^-beta;
            end
        end
        
        function SSE = SumOfSquaredError(obj, A, B, E, beta)
            if nargin < 1
                A = min(obj.ObservedRT);
                B = max(obj.ObservedRT)-min(obj.ObservedRT);
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
                    Fit(obj);
                    fprintf('Generating a report about the current data ...\n')
                    pause(1)
                    formSpecN='The current data set has %i sets of trials\n';
                    formSpecA='The estimated asymptote is %f4\n';
                    formSpecB='The estimated range is %f4\n';
                    formSpecE='The estimated exposure is %f4\n';
                    formSpecBeta='The estimated rate is %f4\n';
                    fprintf(formSpecN, obj.Count)
                    pause(.25)
                    fprintf(formSpecA, obj.EstimatedAsymptote)
                    pause(.25)
                    fprintf(formSpecB, obj.EstimatedRange)
                    pause(.25)
                    fprintf(formSpecE, obj.EstimatedExposure)
                    pause(.25)
                    fprintf(formSpecBeta, obj.EstimatedRate)
                    pause(.25)
                    fprintf('Report complete\n')
                end
    end
    
    methods
        function Fit(obj)
            N=length(obj.ObservedRT);
            fun=@(x) sum(((x(1) + x(2).*(N+x(3)).^-x(4))-obj.ObservedRT).^2);
            presetParameters=[min(obj.ObservedRT), (max(obj.ObservedRT)-min(obj.ObservedRT)), 4, 1];
            opt=optimset('MaxFunEvals', 1e6, 'MaxIter', 1e6);
            x=zeros(1,4);
            x=fminsearch(fun, presetParameters, opt);
            obj.EstimatedAsymptote=x(1);
            obj.EstimatedRange=x(2);
            obj.EstimatedExposure=x(3);
            obj.EstimatedRate=x(4);
        end
    end
end

