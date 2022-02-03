function norm_2d_object = estimate(X)
    X_size = size(X);
    if X_size(1) ~= 2
        error ('input must be of size 2xN')
    end

    mean_matrix = mean(X, 2);
    cov_matrix = cov(X');

norm_2d_object = hojjatazimi.Norm2d(mean_matrix, cov_matrix);
end