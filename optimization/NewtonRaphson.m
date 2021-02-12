classdef NewtonRaphson < handle
    % NewtonRaphson  A class for the NewtonRaphson algorithm
    
    % The main properties
    properties
        Objective
        Derivative
        StartingPointX   double {mustBeReal, mustBeFinite} = 0
        TolerableError   double {mustBeReal, mustBeFinite} = 1e-8
        MaximumIteration double {mustBeReal, mustBeFinite} = 1000
        Verbosity = false
        
        PlotOptions = { ...
            'color'     ,   'blue' , ...
            'marker'    ,      '.' , ...
            'LineStyle' ,   'none' , ...
            'linewidth' ,       2  }
        MarkerOptions = { ...
            'color'     ,    'red' , ...
            'marker'    ,      'o' , ...
            'linewidth' ,       2  }
        LineOptions = { ...
            'color'     ,  'black' , ...
            'LineStyle' ,      ':' , ...
            'linewidth' ,       1  }
    end
    
    % Derived properties that need to be set internally
    properties (SetAccess = private)
        StartingPointY
        CurrentPointY
        NeighborsX
        NeighborsY
        XHistory = []
        YHistory = []
        CurrentPointX
        PlotHandle = []
    end
    
    % Methods are functions that belong to the class
    methods
        
        %%% Constructor function %%%
        
        % A main constructor, for a new NewtonRaphson
        function obj = NewtonRaphson(Objective, Derivative, StartingPointX)
            
            if nargin < 3
                StartingPointX = 0;
            end
            
            obj.Objective      = Objective;
            obj.Derivative     = Derivative;
            
            obj.CurrentPointX  = StartingPointX;
            
            obj.EvaluateCurrentPoint()
            
            obj.StartingPointX = obj.CurrentPointX;
            obj.StartingPointY = obj.CurrentPointY;
            
            obj.AddToHistory();
            
        end
        
        
        %%% Display function %%%
        
        % Print the distribution to screen
        function disp(obj)
            fprintf(['  NewtonRaphson object\n\n' ...
                '      ^ Objective      = %s\n' ...
                '      ^ Derivative     = %s\n' ...
                '      ^ CurrentX       = %f\n' ...
                '      ^ CurrentY       = %f\n' ...
                '      ^ StepCount      = %i\n' ...
                '      ^ TolerableError = %f\n\n' ...
                ], ...
                func2str(obj.Objective) , ...
                func2str(obj.Derivative) , ...
                obj.CurrentPointX, ...
                obj.CurrentPointY, ...
                numel(obj.YHistory), ...
                obj.TolerableError);
        end
        
        
        %%% Computation functions %%%
        
        function EvaluateCurrentPoint(obj)
            obj.CurrentPointY = obj.Objective(obj.CurrentPointX);
        end
        
        function AddToHistory(obj)
            obj.XHistory(end+1) = obj.CurrentPointX;
            obj.YHistory(end+1) = obj.CurrentPointY;
        end
        
        function Step(obj)
            x0  = obj.CurrentPointX;
            gx0 = obj.Derivative(x0);
            
            if ~gx0
                error('Mathematical Error')
            end
            
            fx0 = obj.Objective(x0);
            
            obj.CurrentPointX = x0 - fx0 / gx0;
            
            obj.EvaluateCurrentPoint()
            obj.AddToHistory()
            obj.DisplayStepOutput()
        end
        
        function DisplayStepOutput(obj)
            if obj.Verbosity
                obj.disp()
            end
        end
        
        function r = Solution(obj)
            if abs(obj.CurrentPointY) > obj.TolerableError
                warning('Not convergent')
                r = NaN;
            else
                r = obj.CurrentPointX;
            end
        end
        
        function r = Solve(obj)
            while length(obj.XHistory) <= obj.MaximumIteration && ...
                    abs(obj.CurrentPointY) > obj.TolerableError
                obj.Step()
                obj.Plot()
            end
            r = obj.Solution();
        end
        
        function Plot(obj)
            if isempty(obj.PlotHandle)
                obj.PlotHandle = figure();
            else
                clf
            end
            
            plot(obj.XHistory, obj.YHistory, obj.PlotOptions{:})
            line(obj.CurrentPointX, obj.CurrentPointY, obj.MarkerOptions{:})
            
            xmin = min(xlim);
            ymin = min(ylim);
            
            line([xmin obj.CurrentPointX obj.CurrentPointX], ...
                [obj.CurrentPointY obj.CurrentPointY ymin], obj.LineOptions{:})            
            
            text(.1, .1, sprintf('X = %f\nY = %f', ...
                obj.CurrentPointX, ...
                obj.CurrentPointY), ...
                'units', 'normalized')
        end
        
    end
    
end
