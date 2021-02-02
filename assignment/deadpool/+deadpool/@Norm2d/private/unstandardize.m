function x = unstandardize(obj,z)
    % Transformation of a 2-D Standard Normal Distribution to a Multivariate Normal Mu Covariance sigma
    if length(z) < 2
        error('z must be a 2D vector.')
    end
    A = chol(obj.Covariance).';
    x = A * z + obj.Mean;
end