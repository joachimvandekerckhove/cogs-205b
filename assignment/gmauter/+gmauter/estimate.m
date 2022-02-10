function obj = estimate(X)
            
    Mean = mean(X, 1);
    Cov = cov(X(:, 1), X(:, 2));
    obj = gmauter.Norm2d(Mean, Cov);
    
end