classdef Metropolis < handle
    % Metropolis  A class for the Metropolis algorithm
    % phoenix
    
    % The main properties
    properties
                
        InitialValues  double {mustBeReal, mustBeFinite}
        
        TargetLogPdf function_handle %this should be some default anonymous function
        
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
	AR
        Accept = true
        
        XHistory = []
        YHistory = []

	BurnIn = 10 %Arbitrary number here, should derive this
        
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
		%s = getSampleStatistics(obj);
        	%fprintf("Current Mean: %.2f", s)               
		%fprintf("Step %.2f", obj.StepCount)
		%fprintf("Current X: %.2f", obj.CurrentPointX)
		%fprintf("Current Y: %.2f", obj.CurrentPointY)
		%fprintf("Prop X: %.2f", obj.ProposedPointX)
		%fprintf("Prop Y: %.2f", obj.ProposedPointY)

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
		%obj.StepCount = obj.StepCount + 1
                
            end
            
        end
        
        
        function s = getSampleStatistics(obj)
        
            s = mean(obj.YHistory);
	    %postSD = std(obj.YHistory);
            
        end
                
    end
    
end
