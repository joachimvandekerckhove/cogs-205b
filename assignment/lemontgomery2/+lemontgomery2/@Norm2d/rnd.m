function x = rnd(obj, size)

    % RND    random number generator
    xval1 = normrnd(obj.Mean(1), sqrt(obj.Covariance(1,1)), [1, size]);
    xval2 = normrnd(obj.Mean(2) + sqrt(obj.Covariance(2,2)) * obj.Correlation ...
            .* ((xval1 - obj.Mean(1)) ./ sqrt(obj.Covariance(1,1))), ...
            obj.Covariance(2,2)^2 * sqrt(1 - obj.Correlation^2), ...
            [1, size]);
    x = [xval1; xval2];
       
end