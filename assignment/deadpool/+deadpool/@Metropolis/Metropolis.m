classdef Metropolis < handle
    % Metropolis A class for the Metropolis algorithm

    % Main proporties of the class
    properties 

        InitialValues(:,1)  double {mustBeReal, mustBeFinite};
        
        TargetLogPdf;
        
        TransitionStd = 1;

        BurnIn(1,1) int64 {mustBeFinite,mustBeReal,mustBePositive} = 1;
        
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
        % Posterior samples without burnin period
        PosteriorSamples = [];
    end

    % Methods are functions that belong to the class
    methods

        function obj = set.BurnIn(obj,val)
            %Set number of burnin iterations
            obj.BurnIn = val;
        end
        
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

        %%% Display function %%%
        
        % Print the state of the sampler to screen
        %function disp(obj,niter)
            
        %    wb = waitbar(0,'Sampling... ')

        %    waitbar(obj.StepCount ./ niter , wb )
            
        %end

        % Sampler function

        function DrawSamples(R)

            if R < obj.BurnIn
                error('Number of Iterations Must be Greater than BurnIn')
            end
            
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
                if obj.Accept
                    obj.MakeProposalCurrent();
                end

                %disp(obj,R)
                
                % Add the current point to the chain
                obj.AddToHistory(); 
            end
            obj.PosteriorSamples = obj.CleanHistory()
        end

        function s = getSampleStatistics(obj)
        
            Posteriors = obj.PosteriorSamples(1:obj.XDim,:)
            muhat     = mean(Posteriors , 2);
            sigmahat  = std(Posteriors , [] , 2);
            quantiles = quantile(Posteriors,[0.025,0.25,0.5,0.75,0.975],2);
            s = table(muhat,sigmahat,quantiles);
            s.Properties.VariableNames = {'Mean','SD','2.5%','25%','50%','75%','97.5%'};
            a = sym('theta_%d',[obj.XDim , 1]);
            s.Properties.RowNames = a;
        end
                
    end

end