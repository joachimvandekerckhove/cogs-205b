function [X , Y , I] = CleanHistory(obj)
%CleanHystory - Returns results without BurnIn perdod
    X = obj.XHistory(:, obj.BurnIn+1 : size(obj.XHistory,2))
    Y = obj.YHistory(obj.BurnIn+1 : size(obj.YHistory,1))
    I = obj.BurnIn+1 : size(obj.YHistory,1)
end