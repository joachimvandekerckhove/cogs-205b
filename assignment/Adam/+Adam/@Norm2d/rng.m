% Random number generator
function xax=rng(obj, size)

x1=normrnd(obj.Mean(1),sqrt(obj.Covariance(1,1)),size);

x2=normrnd(obj.Mean(2)+sqrt(obj.Covariance(2,2))*...
    obj.Correlation*(x1-obj.Mean(1))/sqrt(obj.Covariance(1,1)),...
    obj.Covariance(2,2)*sqrt(1-obj.Correlation^2),...
    size);

xax=[x1' x2'];

end


