classdef NelderMead < handle
    % NelderMead  A class for the NelderMead algorithm
    
    % The main properties
    properties
        Objective
        Simplex  double {mustBeReal, mustBeFinite}
        Verbosity = true
        
        Alpha   double {mustBeReal, mustBeFinite} = 1.67
        Gamma   double {mustBeReal, mustBeFinite} = 1.67
        Rho     double {mustBeReal, mustBeFinite} = 0.34
        Sigma   double {mustBeReal, mustBeFinite} = 0.34
        
        PlotOptions = { ...
            'color'     , 'blue' , ...
            'marker'    ,    '.' , ...
            'LineStyle' ,    ':' , ...
            'linewidth' ,     1  }
        LineOptions = { ...
            'color'     ,  'red' , ...
            'marker'    ,    'o' , ...
            'linewidth' ,     2  }
        
    end
    
    % Derived properties that need to be set internally
    properties (SetAccess = private)
        SimplexY
        Centroid
        XHistory   = []
        YHistory   = []
        SHistory   = {}
        SolutionX
        SolutionY
        ReflectedPoint
        ReflectedPointY
        ExpandedPoint
        ExpandedPointY
        ContractedPoint
        ContractedPointY
        
        PlotHandle = []
        SimplexHandle = []
        
        InStep = false
        StepType = 'Initialization'
        Terminated = false
    end
    
    % Methods are functions that belong to the class
    methods
        
        %%% Constructor function %%%
        
        % A main constructor, for a new NelderMead
        function obj = NelderMead(Objective, StartingSimplex)
            
            obj.echo()
            
            if diff(size(StartingSimplex)) ~= 1 % definition of a simplex
                error 'Bad initial simplex'
            end
            
            obj.Objective = Objective;
            obj.Simplex   = StartingSimplex;
            
            obj.EvaluateCurrentSimplex()
            obj.OrderSimplex()
            
            obj.AddToHistory()
            
        end
        
        
        %%% Display function %%%
        
        % Print the distribution to screen
        function disp(obj)
            
            obj.echo()
            
            fprintf(['\n  -----------------\n  NelderMead object\n  -----------------\n\n' ...
                'Objective\n---------\n%s\n\n' ...
                'Simplex\n-------\n%s\n\n' ...
                'CurrentY\n--------\n%s\n\n' ...
                ], ...
                func2str(obj.Objective) , ...
                obj.PrintSimplex, ...
                obj.PrintSimplexY);
            
        end
        
        
        function s = PrintSimplex(obj)
            
            obj.echo()
            
            s = join(join(string(obj.Simplex), ', '), newline);
            
        end
        
        
        function s = PrintSimplexY(obj)
            
            s = join(string(obj.SimplexY), ', ');
            
        end
        
        
        %%% Computation functions %%%
        
        function Step(obj)
            
            obj.echo()
            
            obj.StartStep()
            
            obj.OrderSimplex()
            
            obj.CalculateCentroid()
            
            obj.Reflect();
            obj.Expand();
            obj.Contract();
            obj.Shrink();
            
            obj.DisplayStepOutput()
            
            obj.DecideOnTermination()
            
        end
        
        
        function [s, h] = Solution(obj)
            
            obj.echo()
            
            s = obj.SolutionX;
            h = obj.SolutionY;
            
        end
        
        
        function [s, h] = Solve(obj)
            
            obj.echo()
            
            while ~obj.Terminated
                obj.Step()
                obj.Plot()
            end
            
            obj.DisplayStepOutput()
            [s, h] = obj.Solution();
            
        end
        
        
        function Plot(obj)
            
            obj.echo()
            
            if isempty(obj.PlotHandle)
                obj.PlotHandle = subplot(1,2,1);
            else
                axes(obj.PlotHandle);
            end
            
            plot(1:length(obj.YHistory), obj.YHistory, obj.PlotOptions{:})
            line(repmat(length(obj.YHistory), size(obj.SimplexY)), ...
                obj.SimplexY, obj.LineOptions{:})
            
            obj.DrawSimplex()
            
        end
        
    end
    
    
    methods (Access = private)
        
        function EvaluateCurrentSimplex(obj)
            
            obj.echo()
            
            for vertex = 1:length(obj.Simplex)
                obj.SimplexY(vertex) = obj.Objective(obj.Simplex(:,vertex));
            end
            
        end
        
        
        function AddToHistory(obj)
            
            obj.echo()
            
            obj.SHistory{end+1} = obj.StepType;
            obj.XHistory{end+1} = obj.Simplex;
            obj.YHistory(end+1) = min(obj.SimplexY);
        end
        
        
        function OrderSimplex(obj)
            
            obj.echo()
            
            [obj.SimplexY, order] = sort(obj.SimplexY);
            obj.Simplex = obj.Simplex(:, order);
            
        end
        
        
        function StartStep(obj)
            
            obj.echo()
            
            obj.InStep = true;
            
        end
        
        
        function EndStepOn(obj, type)
            
            obj.echo()
            
            obj.InStep = false;
            obj.StepType = type;
            
            obj.AddToHistory();
            obj.OrderSimplex();
            
        end
        
        
        function DecideOnTermination(obj)
            
            obj.echo()
            
            if std(obj.SimplexY) < .0001
                [obj.SolutionY, location] = min(obj.SimplexY);
                obj.SolutionX = obj.Simplex(:,location);
                obj.EndStepOn('Termination')
                obj.Terminated = true;
            end
            
        end
        
        
        function CalculateCentroid(obj)
            
            obj.echo()
            
            obj.Centroid = mean(obj.Simplex(:,1:end-1),2);
            
        end
        
        
        function Reflect(obj)
            
            obj.echo()
            
            obj.ReflectedPoint = obj.Centroid + ...
                obj.Alpha * (obj.Centroid - obj.Simplex(:,end));
            obj.ReflectedPointY = obj.Objective(obj.ReflectedPoint);
            
            if obj.SimplexY(1) < obj.ReflectedPointY && ...
                    obj.ReflectedPointY < obj.SimplexY(end)
                obj.Simplex(:,end) = obj.ReflectedPoint;
                obj.SimplexY(end) = obj.ReflectedPointY;
                obj.EndStepOn('Reflection')
            end
            
        end
        
        
        function Expand(obj)
            
            obj.echo()
            
            if ~obj.InStep, return, end
            
            if obj.ReflectedPointY < obj.SimplexY(1)
                
                obj.ExpandedPoint = obj.Centroid + ...
                    obj.Gamma * ( obj.ReflectedPoint - obj.Centroid );
                obj.ExpandedPointY = obj.Objective(obj.ExpandedPoint);
                
                if obj.ExpandedPointY < obj.ReflectedPointY
                    obj.Simplex(:,end) = obj.ExpandedPoint;
                    obj.SimplexY(end) = obj.ExpandedPointY;
                    obj.EndStepOn('Expansion')
                else
                    obj.Simplex(:,end) = obj.ReflectedPoint;
                    obj.SimplexY(end) = obj.ReflectedPointY;
                    obj.EndStepOn('Reflection')
                end
                
            end
            
        end
        
        
        function Contract(obj)
            
            obj.echo()
            
            if ~obj.InStep, return, end
            
            obj.ContractedPoint = obj.Centroid + ...
                obj.Rho * ( obj.Simplex(:,end) - obj.Centroid );
            obj.ContractedPointY = obj.Objective(obj.ContractedPoint);
            
            if obj.ContractedPointY < obj.SimplexY(:,end)
                obj.Simplex(:,end) = obj.ContractedPoint;
                obj.SimplexY(end) = obj.ContractedPointY;
                obj.EndStepOn('Contraction')
            end
            
        end
        
        
        function Shrink(obj)
            
            obj.echo()            
            
            if ~obj.InStep, return, end    
            
            for vertex = 2:length(obj.Simplex)
                obj.Simplex(:,vertex) = obj.Simplex(:,1) + ...
                    obj.Sigma * (obj.Simplex(:,vertex) - obj.Simplex(:,1));
                obj.SimplexY(vertex) = obj.Objective(obj.Simplex(:,vertex));
            end            
            
            obj.EndStepOn('Shrink')
            
        end
        
        
        function DisplayStepOutput(obj)
            
            obj.echo()
            
            if obj.Verbosity
                if obj.Verbosity > 1
                    obj.disp()
                end
                disp(obj.StepType)
            end
            
        end
        
        
        function DrawSimplex(obj)
            
            obj.echo()
            
            if isempty(obj.SimplexHandle)
                obj.SimplexHandle = subplot(1,2,2);
            else
                axes(obj.SimplexHandle);
            end
            
            line(obj.Simplex(1,[1:end 1]), ...
                obj.Simplex(2,[1:end 1]), ...
                'linestyle', '-', ...
                'marker', '.', ...
                'color', rand(3,1))
            
            pause(.1)
            
        end
        
    end
    
    % Static methods don't need the object as input
    methods (Static)
        
        function echo() , return
            st = dbstack;
            namestr = st(2).name;
            fprintf(' > %s\n', upper(namestr))
        end
    end
    
end
