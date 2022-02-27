function out=estimate(X)
    if size(X,1)~=2
        error('Norm2d:estimate:wrongSize', "The data should be 2*N matrix")
        X=X'
    end
    Mean=mean(X,2);
    Covariance=cov(X(1,:),X(2,:))
    out=marjan.Norm2d(Mean,Covariance)
end
