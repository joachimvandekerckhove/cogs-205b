% Returns CleanSampleX, the matrix of sampled points without the burnin;
% CleanSampleY, the vector of corresponding function values; and
% CleanIndex, the vector of indices that belong to the retained points. 
function [CleanSampleX, CleanSampleY, CleanIndex] = CleanHistory(obj)
            
            %Keep sampled points from Burnin+1 to the End of the chain
            Start = obj.BurnIn+1;
            End = size(obj.XHistory,2);
            CleanSampleX = obj.XHistory(:,Start:End);
            CleanSampleY = obj.YHistory(:,Start:End);
            
            %Create a vector with numbers 1 to the length of the clean
            %vector of values sampled            
            CleanLength = size(CleanSampleX,2);
            CleanIndex = 1:CleanLength;            

end

