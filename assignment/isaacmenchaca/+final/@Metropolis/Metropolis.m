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
        
        function obj = Metropolis(TargetLogPdf, InitialValues) % constructor
            
            obj.TargetLogPdf   = TargetLogPdf; % target function, fin a function passed as param.
            obj.InitialValues  = InitialValues; 
            obj.XDimensions    = numel(InitialValues); % returns the number of elements/ gets dimension
            obj.CurrentPointX  = obj.InitialValues; % current/ intial values of X
            obj.EvaluateCurrentPoint() % get Y from transformed X
            
            obj.AddToHistory() % store the respective X and Y
                        
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
                % point the current point. 
                % Draw a randomly selected u from U(0,1). If log(α) > log(u), set θ(i) ← θc, otherwise set θ(i) ← θ(i−1)

                if obj.AcceptProposal
                    obj.MakeProposalCurrent() % make proposed the current if accepted.
                end % else keep current the same as previous
                
                % Add the current point to the chain
                obj.AddToHistory()
                
            end
            
        end

    end
    
    methods

        [CleanSampleX, CleanSampleY, CleanIndex] = CleanHistory(obj)
        
        dic = DIC(obj)

        disp(obj)
        plotMetrop(obj, txt);
    end
    
    methods (Access = private)

        AddToHistory(obj) % completed
        ComputeLogAcceptanceRatio(obj) % completed
        DecideAccept(obj) % completed
        DrawProposal(obj) % completed
        EvaluateCurrentPoint(obj) % completed
        EvaluateProposedPoint(obj) % completed
        MakeProposalCurrent(obj) % completed
        

    end
    
    methods (Static)
    
        t = test()
        
    end

end
