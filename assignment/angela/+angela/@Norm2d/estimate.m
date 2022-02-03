function obj = estimate(X)

    meanData = mean(X,2);
    covData = cov(X(1,:),X(2,:));

    obj = angela.Norm2d(meanData,covData);

end