classdef HillClimber < handle
    % HillClimber  A class for the HillClimber algorithm
    
    % The main properties
    properties
        Objective
        StartingPointX double {mustBeReal, mustBeFinite} = 0
        StepSize       double {mustBeReal, mustBeFinite} = 1
        Verbosity = false
        Maximize  = true
        
        PlotOptions = { ...
            'color'     , 'blue' , ...
            'marker'    ,    '.' , ...
            'LineStyle' , 'none' , ...
            'linewidth' ,     2  }
        LineOptions = { ...
            'color'     ,  'red' , ...
            'marker'    ,    'o' , ...
            'linewidth' ,     2  }
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
        
        % A main constructor, for a new HillClimber
        function obj = HillClimber(Objective, StartingPointX)
            
            if nargin < 2
                StartingPointX = 0;
            end
            
            obj.Objective      = Objective;
            obj.CurrentPointX  = StartingPointX;
            
            obj.EvaluateCurrentPoint()
            
            obj.StartingPointX = obj.CurrentPointX;
            obj.StartingPointY = obj.CurrentPointY;
            
            obj.AddToHistory();
            
        end
        
        
        %%% Display function %%%
        
        % Print the distribution to screen
        function disp(obj)
            fprintf(['  HillClimber object\n\n' ...
                '      ^ Objective = %s\n' ...
                '      ^ CurrentX  = %f\n' ...
                '      ^ CurrentY  = %f\n' ...
                '      ^ StepCount = %i\n' ...
                '      ^ StepSize  = %f\n\n' ...
                ], ...
                func2str(obj.Objective) , ...
                obj.CurrentPointX, ...
                obj.CurrentPointY, ...
                numel(obj.YHistory), ...
                obj.StepSize);
        end
        
        
        %%% Getters and setters %%%
        %%% ...
        
        
        %%% Computation functions %%%
        
        function EvaluateCurrentPoint(obj)
            obj.CurrentPointY = obj.Objective(obj.CurrentPointX);
        end
        
        function AddToHistory(obj)
            obj.XHistory(end+1) = obj.CurrentPointX;
            obj.YHistory(end+1) = obj.CurrentPointY;
        end
        
        function SelectNeighbors(obj)
            obj.NeighborsX = obj.CurrentPointX + [-1 1] * obj.StepSize;
        end
        
        function EvaluateNeighbors(obj)
            obj.NeighborsY = arrayfun(obj.Objective, obj.NeighborsX);
        end
        
        function UpdateStepSize(obj)
            if length(obj.XHistory) > 5 && obj.CurrentPointX == obj.XHistory(end-2)
                obj.StepSize = obj.StepSize * .67;
            end
        end
        
        function UpdateCurrent(obj)
            if obj.Maximize
                [optimum, location] = max(obj.NeighborsY);
            else
                [optimum, location] = min(obj.NeighborsY);
            end
            obj.CurrentPointX = obj.NeighborsX(location);
            obj.CurrentPointY = optimum;
        end
        
        function Step(obj)
            obj.SelectNeighbors()
            obj.EvaluateNeighbors()
            obj.UpdateCurrent()
            obj.AddToHistory()
            obj.UpdateStepSize()
            obj.DisplayStepOutput()
        end
        
        function DisplayStepOutput(obj)
            if obj.Verbosity
                obj.disp()
            end
        end
        
        function [s, h] = Solution(obj)
            s = obj.CurrentPointX;
            h = obj.CurrentPointY;
        end
        
        function [s, h] = Solve(obj, threshold)
            while abs(obj.CurrentPointY-obj.YHistory(end-1)) > threshold
                obj.Step()
                obj.Plot()
            end
            [s, h] = obj.Solution();
        end
        
        function Plot(obj)
            if isempty(obj.PlotHandle)
                obj.PlotHandle = figure();
            else
                clf
            end
            
            plot(obj.XHistory, obj.YHistory, obj.PlotOptions{:})
            line(obj.CurrentPointX, obj.CurrentPointY, obj.LineOptions{:})
            text(.1, .1, sprintf('X = %f\nY = %f', ...
                obj.CurrentPointX, ...
                obj.CurrentPointY), ...
                'units', 'normalized')
        end
        
    end
    
    
    % Static methods don't need the object as input
    methods (Static)
        
    end
    
end
