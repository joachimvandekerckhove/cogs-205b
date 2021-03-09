classdef Metropolis < handle
    % Metropolis A class for the Metropolis algorithm

    % Main proporties of the class
    properties 

        InitialValues(:,1)  double {mustBeReal, mustBeFinite};
        
        TargetLogPdf;
        
        TransitionStd = 1;
        
    end    

    % Derived properties that need to be set internally
    properties (SetAccess = private)
        % Proposed XDim dimentional point in X
        PointX;
        % Proposed One dimentional point in y
        PointY;
         
        % Number of parameters
        XDim;
        % Iteration number
        StepCount = 0;
        % Log of acceptance ratio
        LogAccept;
        % Logical for acceptance
        Accept = true;
        
        % XDim x Iterations matrix of accepted values
        XHistory = [];
        % Vector of densities at each accepted value.
        YHistory = [];
    end

    % Methods are functions that belong to the class
    methods
        
        %%% Constructor function %%%
        
        % A main constructor, for a new Metropolis
        function obj = Metropolis(TargetLogPdf, InitialValues)
            
            obj.TargetLogPdf   = TargetLogPdf;
            obj.InitialValues  = InitialValues;
            obj.XDim           = numel(InitialValues);
            
            obj.PointX  = obj.InitialValues;
            
            obj.EvaluateCurrentPoint(); 
            
            obj.AddToHistory();
        end

        function DrawSamples(obj, R)
            
            % Draws R samples from the target distribution
            
            for i = 1:R
                
                %  Draw a randomly selected point from the proposal
                %  distribution
                obj.DrawProposal();
                obj.EvaluateCurrentPoint();
                
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

end