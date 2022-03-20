function Fit(obj)
    t = 1:obj.Count;
    fun = @(x) sum((x(1)+x(2).*(t+x(3)).^(-x(4)) - obj.ObservedRT) .^2);
    options = optimset('MaxFunEvals', 1e5, 'MaxIter', 1e5);
    %initial values are important, first 2: hundreds, last 2: set away from
    %0! It will be really unstable near the border!
    %Or to use the return loss from fminsearch and find the lowest loss
    %among all the possible estimations.
    xfind = fminsearch(fun,[mean(obj.ObservedRT) 100 1 1],options); %[100 100 1 1]
    obj.EstimatedAsymptote = xfind(1);
    obj.EstimatedRange = xfind(2);
    obj.EstimatedExposure = xfind(3);
    obj.EstimatedRate = xfind(4);
end