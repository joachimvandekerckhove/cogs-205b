classdef Metropolis < handle
    % Metropolis  A class for the Metropolis algorithm
    
    % The main properties
    properties
                
        InitialValues  double {mustBeReal, mustBeFinite}
        
        TargetLogPdf function_handle
        
        TransitionStd  double {mustBeReal, mustBeFinite} = 1
        
    end
    
    % Derived properties that need to be set internally
    properties (SetAccess = private)
        
        CurrentPointX
        CurrentPointY
        
        ProposedPointX
        ProposedPointY
        
        XDim
        StepCount = 0
        Accept = true
        
        XHistory = []
        YHistory = []
        
        LogAcceptanceRatio
        BurnIn
        
    end
        
    % Methods are functions that belong to the class
    methods
        
        %%% Constructor function %%%
        
        % A main constructor, for a new Metropolis
        function obj = Metropolis(TargetLogPdf, InitialValues)
            
            obj.TargetLogPdf   = TargetLogPdf;
            obj.InitialValues  = InitialValues;
            obj.XDim           = numel(InitialValues);
            
            obj.validateInputs;
            
            obj.CurrentPointX  = obj.InitialValues;
            
            obj.EvaluateCurrentPoint();
            
            obj.AddToHistory();
                        
        end
        
        
        %%% Display function %%%
        
        % Print the state of the sampler to screen
        function disp(obj)
            
            error('Not yet implemented: disp()')
            
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
        
            error('Not yet implemented: getSampleStatistics()')
%             s.mean = 
        end
                
    end
    
end
