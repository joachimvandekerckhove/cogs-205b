function yax = rnd(obj, dim)
    if nargin < 2, dim = 1; end 
    rndnum1 =  randn(1,dim);
    x1 = JieWanHW.Norm2d.unstandardize(obj.Mean(1), rndnum1, obj.Std(1));
    mean2 = obj.Mean(2) + obj.Std(2) * obj.Correlation * rndnum1;
    std2 = obj.Std(2)^2 * sqrt(1-(obj.Correlation)^2);
    rndnum2 = randn(1,dim); %needed a new random number seq or not?
    x2 = JieWanHW.Norm2d.unstandardize(mean2, rndnum2, std2);
    yax = [x1;x2];
end