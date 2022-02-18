classdef PowerLawFitter < handle
    % Assignment 5
    % The power law of practice says that expected (mean) reaction time ERT
    % decreases according to a power law as a function of number of trials
    % N
    % ERT_N = A + B * (N + E)^(-beta)
    % where:
    %   A       = asymptote
    %   B       = range
    %   E       = exposure
    %   beta    = rate
    
    % TO-DO:
    % - implement at least 1 test for each property
    % - implement at least 1 test for each method
    % x make sse method
    % x make expectation method
    % x make fit method
    % x make disp method
    % x make constructor 
    % x setter for ObservedRT
    % BONUS:
    % - implement some way to keep track of the data (ObservedRT) and the
    %   parameter estimates
    % - implement 2 tests for this ^
    
    properties
        ObservedRT (1,:)
    end
    
    properties (Dependent)
        Count
    end
    
    properties (SetAccess = private)
        EstimatedAsymptote
        EstimatedRange
        EstimatedExposure
        EstimatedRate
        Loss
        fittedData
    end
    
    methods
        
        %%% constructor function %%%%
        function obj = PowerLawFitter(data)
            
            if nargin < 1
                data = [ 313 306 300 293 287 288 285 281 279 275 274 273 271 272 275 268 269 265 269 264 266 264 265 264 263 ];
            end
        
            obj.ObservedRT = data;
            
        end
        
        
        %%% display function %%%
        function disp(obj)
            fprintf(['    PowerLawFitter object\n\n' ...
                     '       Data: %i observations\n' ...
                     '         max(RT)   = %0.3f\n' ...
                     '         min(RT)   = %0.3f\n\n' ...
                     ], ...
                     obj.Count, ...
                     max(obj.ObservedRT), ...
                     min(obj.ObservedRT));
            
            if isempty(obj.EstimatedAsymptote)
                fprintf('       No parameter estimates for these data.\n\n');
            else
                fprintf(['       Parameter estimates:\n' ...
                         '         Asymptote = %0.3f\n' ...
                         '         Range     = %0.3f\n' ...
                         '         Exposure  = %0.3f\n' ...
                         '         Rate      = %0.3f\n\n' ...
                         '       Loss:\n' ...
                         '         SSE       = %0.3f\n\n'...
                         ], ...
                         obj.EstimatedAsymptote, ...
                         obj.EstimatedRange, ...
                         obj.EstimatedExposure, ...
                         obj.EstimatedRate, ...
                         obj.Loss);
            end
        end
        
        
        %%% getters and setters %%%
        
        function set.ObservedRT(obj,rvec)
            red = checkData(obj,rvec);
            switch red
                case 0
                    obj.clearParams();
                    obj.ObservedRT = rvec;
                case 1
                    obj.ObservedRT = rvec;
            end
        end
        
        function count = get.Count(obj)
            count = size(obj.ObservedRT,2);
        end
        
        function set.Count(obj,~)
            fprintf('Count is: %f \n',obj.Count);
            error('You cannot set the Count property');
        end
        
        function obj = clearParams(obj)
            obj.EstimatedAsymptote = [];
            obj.EstimatedRange = [];
            obj.EstimatedExposure = [];
            obj.EstimatedRate = [];
            obj.Loss = [];
            obj.fittedData = [];
        end
        
        
        %%% computation functions %%%
        
        % calculate expected reaction time
        function ert = Expectation(obj,A,B,E,beta)
            ert = nan(1,obj.Count); % initialize
            for ii = 1:obj.Count
                ert(ii) = A + B * (ii + E).^-beta;
            end
        end
        
        % calculate sse
        function sse = SumOfSquaredError(obj,params)
            A       = params(1);
            B       = params(2);
            E       = params(3);
            beta    = params(4);
            
            ert     = Expectation(obj,A,B,E,beta);
            sse     = sum((ert - obj.ObservedRT).^2);
        end
        
        % fit power function
        function Fit(obj)
            if ~isempty(obj.fittedData)
                red = obj.checkData();
                switch red
                    case 1: fprintf('I already have parameters for this data set.\n')
                    case 0
                        obj.solve();
                end
            else
                obj.solve();
            end
        end
        
        % solve
        function solve(obj)
            % pick some starting values
            startingValues = [min(obj.ObservedRT),max(obj.ObservedRT)-min(obj.ObservedRT),1,1]; % [a,b,e,beta]

            % do fminsearch
            objective = @(params) SumOfSquaredError(obj,params);
            solution = fminsearch(objective,startingValues,optimset('MaxFunEvals',1e4,'MaxIter',1e4));

            % set parameters
            obj.EstimatedAsymptote = solution(1);
            obj.EstimatedRange = solution(2);
            obj.EstimatedExposure = solution(3);
            obj.EstimatedRate = solution(4);
            obj.Loss = SumOfSquaredError(obj,solution);
            obj.fittedData = obj.ObservedRT;
        end
        
        % plot ObservedRT and fit (if applicable) 
        function Plot(obj)
            x = linspace(1,length(obj.ObservedRT),length(obj.ObservedRT));
            figure
            plot(x,obj.ObservedRT,'o');
            hold on
            if ~isempty(obj.EstimatedAsymptote)
                fit = Expectation(obj,obj.EstimatedAsymptote,obj.EstimatedRange,obj.EstimatedExposure,obj.EstimatedRate);
                plot(x,fit,'-')
                legend('ObservedRT','Fit')
            else
                legend('ObservedRT')
            end   
        end
        
        % check if input data matches old data
        function redundancy = checkData(obj,newData)
            if nargin < 2
                newData = obj.fittedData;
            end
            
            if isequal(obj.ObservedRT,newData)
                redundancy = 1;
            else
                redundancy = 0;
            end
        end
        
        
    end

    
    
    
end
