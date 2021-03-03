function [X , Y , I] = CleanHistory()
%CleanHystory - Returns results without BurnIn perdod
    X = obj.XHistory(:, obj.BurnIn+1 : size(obj.XHistory,2))
    Y = obj.YHistory(obj.BurnIn+1 : size(obj.YHistory))
    I = obj.BurnIn+1 : size(obj.YHistory)
end