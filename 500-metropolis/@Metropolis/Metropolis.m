classdef Metropolis < handle
    % METROPOLIS  A class for Metropolis sampling

    properties

    end

    
    methods
        

        function DrawSamples(obj)
        end
        
        %%% Display function %%%
        
        function disp(obj)
        


        end

    end
    
    methods
    
        [CleanSampleX, CleanSampleY, CleanIndex] = CleanHistory(obj)

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
