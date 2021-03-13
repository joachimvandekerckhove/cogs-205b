classdef Metropolis < handle
    % Metropolis  A class for the Metropolis algorithm
    
    % The main properties
    properties
                
        InitialValues  double {mustBeReal, mustBeFinite}
        
        TargetLogPdf function_handle 
        
        TransitionStd = 1
        
    end
    
    % Derived properties that need to be set internally
    properties (SetAccess = private)
        
        CurrentPointX
        CurrentPointY
        
        ProposedPointX
        ProposedPointY
        
        XDim 
        StepCount = 0
        LogAcceptRatio = 0
        Accept = true
        
        XHistory = []
        YHistory = []
        
    end
        
    % Methods are functions that belong to the class
    methods
        
        %%% Constructor function %%%
        
        % A main constructor, for a new Metropolis
        function obj = Metropolis(TargetLogPdf, InitialValues)
            
            obj.TargetLogPdf   = TargetLogPdf;
            obj.InitialValues  = InitialValues;
            obj.XDim           = numel(InitialValues);
            
            obj.CurrentPointX  = obj.InitialValues;
            
            obj.EvaluateCurrentPoint();
            
            obj.AddToHistory();
                        
        end
        
        
        %%% Display function %%%
        
        % Print the state of the sampler to screen
        function disp(obj)
            s = obj.getSampleStatistics();
            fprintf('%15s', ' > estimate: ');
            fprintf('%5.1f ', s(1,:));fprintf('\n');
            fprintf('%15s', ' > std: ');
            fprintf('%5.2f ', s(2,:));fprintf('\n');
            
        end
        
        
        % Sample function
        
        function DrawSamples(obj, R)
            
            % Draws R samples from the target distribution
            
            for i = 1:R
                
                %  Draw a randomly selected point from the proposal
                %  distribution
                obj.DrawProposal();
                obj.EvaluateProposedPoint();
                
                %  Compute the acceptance ratio
                obj.ComputeLogAcceptanceRatio();
                
                % Decide whether to accept the proposal
                obj.DecideAccept();
                
                % If the proposal should be accepted, make the proposed
                % point the current point
                if obj.Accept()
                    obj.MakeProposalCurrent();
                end
                
                % Add the current point to the chain
                obj.AddToHistory();
                
            end
            
        end
        
        
        function s = getSampleStatistics(obj)
            % s= 2 x XDim matrix, first row = mean, second row = std
            % skip first 10% 
            usefulXHistory = obj.XHistory(ceil(size(obj.XHistory,2)*0.1):end, :);
            s = [mean(usefulXHistory,1); std(usefulXHistory,1)];
            
        end
                
    end
    
end
