classdef Metropolis < handle
    % Metropolis  A class for the Metropolis algorithm
    
    % The main properties
    properties
        InitialValues  (:,1) double {mustBeReal, mustBeFinite}
        TargetLogPdf   (1,1) function_handle = @(x)x
        BurnIn         (1,1) double {mustBeNonnegative} = 0
    end
    
    properties (Hidden, Constant)
        TransitionStd = 1        
    end
    
    properties (SetAccess = private)
        
        CurrentPointX
        CurrentPointY
        
        ProposedPointX
        ProposedPointY
        
        XDimensions

        LogAcceptanceRatio
        AcceptProposal
        
        XHistory = []
        YHistory = []
        
    end
        
    methods
        
        function obj = Metropolis(TargetLogPdf, InitialValues)
            
            obj.TargetLogPdf   = TargetLogPdf;
            obj.InitialValues  = InitialValues;
            obj.XDimensions    = numel(InitialValues);
            
            obj.CurrentPointX  = obj.InitialValues;
            
            obj.EvaluateCurrentPoint()
            
            obj.AddToHistory()
                        
        end
        
        
        function DrawSamples(obj, R)
            
            for i = 1:R
                
                % Draw a random point from the proposal distribution
                obj.DrawProposal()

                % Calculate the target function at the proposal point
                obj.EvaluateProposedPoint()
                
                % Compute the log acceptance ratio
                obj.ComputeLogAcceptanceRatio()
                
                % Decide whether to accept the proposal
                obj.DecideAccept()
                
                % If the proposal should be accepted, make the proposed
                % point the current point
                if obj.AcceptProposal()
                    obj.MakeProposalCurrent()
                end
                
                % Add the current point to the chain
                obj.AddToHistory()
                
            end
            
        end

    end
    
    methods

        [CleanSampleX, CleanSampleY, CleanIndex] = CleanHistory(obj)
        
        dic = DIC(obj)

%         disp(obj)  % Not sure where your disp.m went :/  -jv
        
    end
    
    methods (Access = private)

        AddToHistory(obj)
        ComputeLogAcceptanceRatio(obj)
        DecideAccept(obj)
        DrawProposal(obj)
        EvaluateCurrentPoint(obj)
        EvaluateProposedPoint(obj)
        MakeProposalCurrent(obj)

    end
    
    methods (Static)
    
        t = test()
        
    end

end
